import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'dart:developer';
import 'package:gps_test/core/modules/car/repository.dart';
import 'package:gps_test/core/providers/providers.dart';
import 'package:gps_test/core/services/services.dart';

import 'package:gps_test/ui/modules/car/car_screen.dart';
import 'package:gps_test/ui/utils/utils.dart';

final loginControllerProvider = Provider<LoginController>((ref) {
  final carRepo = ref.watch(carRepoProvider);
  return LoginController(repository: carRepo);
});

class LoginController {
  LoginController({required this.repository});
  final CarRepository repository;

  Future<void> requestLogin(BuildContext context) async {
    try {
      //1.- check network connection
      final connectivity = await Connectivity().checkConnectivity();
      if (connectivity.contains(ConnectivityResult.none)) {
        // throw Exception('Sin conexión a internet. Verifica tu red.');
        if (!context.mounted) return;
        AppToast.showMessage(
          context,
          type: ToastTypes.warning,
          title: 'Oops',
          subtitle: 'Sin conexión a internet. Verifica tu red.',
        );

        return;
      }

      //2.- request login and compare with stored eID
      final loginInfo = await repository.requestLogin();
      final storedEid = await AppLocalStorage.getValue('eID');

      if (storedEid != null && storedEid == loginInfo.eid) {
        // same eID -> session is still active
        log('Session still active, eID unchanged: $storedEid');
      } else {
        //3.- different (or missing) eID -> replace it on localstorage
        await AppLocalStorage.saveValue('eID', loginInfo.eid);
        log('eID replaced on localstorage: ${loginInfo.eid}');
      }

      if (!context.mounted) return;
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (context) => CarScreen()),
      );
    } on WialonException catch (exp) {
      if (!context.mounted) return;
      AppToast.showMessage(
        context,
        title: 'error',
        subtitle: exp.toString(),
        type: ToastTypes.error,
      );
    } catch (error) {
      log('Error: ${error.toString()}');

      AppToast.showMessage(
        context,
        type: ToastTypes.error,
        title: 'Ocurrio un error:',
        subtitle: error.toString(),
      );
    }
  }
}
