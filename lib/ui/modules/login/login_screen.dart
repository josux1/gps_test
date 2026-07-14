import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animate_do/animate_do.dart';

import 'package:gps_test/core/services/services.dart';
import 'package:gps_test/ui/modules/login/controller.dart';
import 'package:gps_test/ui/utils/utils.dart';
import 'package:gps_test/ui/widgets/widgets.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = ref.watch(loginControllerProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: 'logo',
            child: FadeInDown(
              child: Center(
                child: Image.asset(
                  AppAssets.appImageWialonLogoText,
                  height: size.height * 0.2,
                ),
              ),
            ),
          ),

          Text('Iniciar Sesión', style: AppText.title),
          CustomLoadingButton(
            title: 'Continuar como invitado',
            onPressed: () => controller.requestLogin(context),
          ),
        ],
      ),
    );
  }
}
