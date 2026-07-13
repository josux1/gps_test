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
  WialonCar? car;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      car = await ref.read(carControllerProvider).getCarById(context);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);
    final size = MediaQuery.of(context).size;

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
        ],
      ),
      bottomNavigationBar: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 14),
        child: CustomPrimaryButton(
          title: 'Consultar kilometraje',
          onPressed: () async {
            car = await ref.read(carControllerProvider).getCarById(context);
            setState(() {});
          },
        ),
      ),
    );
  }
}
