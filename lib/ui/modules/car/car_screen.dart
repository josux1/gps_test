import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_test/core/modules/car/wialon_car.dart';
import 'package:gps_test/core/providers/providers.dart';
import 'package:gps_test/core/services/app_assets.dart';
import 'package:gps_test/ui/modules/car/controller.dart';
import 'package:gps_test/ui/utils/app_string_utils.dart';
import 'package:gps_test/ui/utils/app_textstyles.dart';
import 'package:gps_test/ui/widgets/custom_button.dart';

class CarScreen extends ConsumerStatefulWidget {
  const CarScreen({super.key});

  @override
  ConsumerState<CarScreen> createState() => _CarScreenState();
}

class _CarScreenState extends ConsumerState<CarScreen> {
  WialonCar? _previousCar;
  String? _legend;

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);
    final size = MediaQuery.of(context).size;

    ref.listen<AsyncValue<WialonCar>>(carByIdProvider, (previous, next) {
      next.whenData((newCar) {
        setState(() {
          if (_previousCar == null) {
            _legend = null;
          } else if (_previousCar!.toRawJson() != newCar.toRawJson()) {
            _legend = 'Los datos cambiaron';
          } else {
            _legend = 'Los datos se mantienen iguales';
          }
          _previousCar = newCar;
        });
      });
    });

    final carAsync = ref.watch(carByIdProvider);
    final car = carAsync.value ?? _previousCar;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: Hero(
          tag: 'logo',
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Image.asset(AppAssets.appImageWialonLogo),
              ),
            ),
          ),
        ),
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
        physics: NeverScrollableScrollPhysics(),
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
          Center(child: Text(car?.item.nm ?? 'car name', style: AppText.title)),

          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            AppFormat.distanceToKm(car?.item.cnm ?? 0),
                            style: AppText.subtitle,
                          ),
                          Text('Kilometraje', style: AppText.text),
                        ],
                      ),
                    ),
                  ),

                  Card(
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('${car?.item.cneh} h', style: AppText.subtitle),
                          Text('Horas de motor', style: AppText.text),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_legend != null)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Center(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: Row(
                    key: ValueKey(_legend),
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _legend == 'Los datos cambiaron'
                            ? Icons.autorenew_rounded
                            : Icons.check_circle_outline_rounded,
                        size: 18,
                        color: _legend == 'Los datos cambiaron'
                            ? Colors.orange
                            : Colors.green,
                      ),
                      const SizedBox(width: 6),
                      Text(_legend!, style: AppText.text),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 14),
        child: CustomPrimaryButton(
          title: 'Consultar kilometraje',
          onPressed: () {
            ref.invalidate(carByIdProvider);
          },
        ),
      ),
    );
  }
}
