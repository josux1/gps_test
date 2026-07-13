import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_test/core/modules/car/repository.dart';
import 'package:gps_test/core/modules/car/wialon_car.dart';
import 'package:gps_test/core/providers/providers.dart';
import 'package:gps_test/ui/utils/app_toast.dart';

final carControllerProvider = Provider<CarController>((ref) {
  final carRepo = ref.watch(carRepoProvider);
  return CarController(ref: ref, repository: carRepo);
});

class CarController {
  CarController({required this.ref, required this.repository});
  final CarRepository repository;
  Ref ref;

  void toggleTheme() {
    ref.read(themeProvider.notifier).update((old) {
      if (old == ThemeMode.dark) {
        return ThemeMode.light;
      } else {
        return ThemeMode.dark;
      }
    });
  }

  Future<WialonCar?> getCarById(BuildContext context) async {
    try {
      //1.- check network connection
      final connectivity = await Connectivity().checkConnectivity();
      if (connectivity.contains(ConnectivityResult.none)) {
        // throw Exception('Sin conexión a internet. Verifica tu red.');
        if (!context.mounted) return null;
        AppToast.showMessage(
          context,
          type: ToastTypes.warning,
          title: 'Oops',
          subtitle: 'Sin conexión a internet. Verifica tu red.',
        );

        return null;
      }

      return await repository.getCarbyId();
    } catch (error) {
      log('Error: ${error.toString()}');

      if (!context.mounted) return null;
      AppToast.showMessage(
        context,
        type: ToastTypes.error,
        title: 'Ocurrio un error:',
        subtitle: error.toString(),
      );
    }
    return null;
  }
}
