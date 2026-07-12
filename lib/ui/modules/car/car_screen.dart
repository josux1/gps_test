import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_test/core/providers/providers.dart';
import 'package:gps_test/core/services/app_assets.dart';
import 'package:gps_test/ui/modules/car/controller.dart';
import 'package:gps_test/ui/utils/app_colors.dart';
import 'package:gps_test/ui/utils/app_textstyles.dart';

class CarScreen extends ConsumerStatefulWidget {
  const CarScreen({super.key});

  @override
  ConsumerState<CarScreen> createState() => _CarScreenState();
}

class _CarScreenState extends ConsumerState<CarScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Wialon'),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              ref.read(carControllerProvider).toggleTheme();
            },
            icon: Icon(
              theme == ThemeMode.light ? Icons.mode_night_rounded : Icons.sunny,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 28),
        children: [
          AnimatedSwitcher(
            duration: Duration(milliseconds: 1000),
            switchInCurve: Curves.linear,
            switchOutCurve: Curves.linear,
            child: theme == ThemeMode.light
                ? Image.asset(
                    height: size.height * 0.22,
                    AppAssets.appImageCarLight,
                  )
                : Image.asset(
                    height: size.height * 0.22,
                    AppAssets.appImageCarDark,
                  ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Center(
              child: Card(
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12,
                  ),
                  child: Text('100 km/h', style: AppTextStyles.title),
                ),
              ),
            ),
          ),
          Center(child: Text('Sin cambios', style: AppTextStyles.text)),
        ],
      ),
      bottomNavigationBar: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 12),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shadowColor: Colors.transparent,
            backgroundColor: AppColors.primary,
          ),
          onPressed: () {},
          child: Text('Consultar kilometraje', style: AppTextStyles.textLight),
        ),
      ),
    );
  }
}
