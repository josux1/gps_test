import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_test/core/providers/providers.dart';
import 'package:gps_test/core/services/app_assets.dart';

class CarScreen extends ConsumerStatefulWidget {
  const CarScreen({super.key});

  @override
  ConsumerState<CarScreen> createState() => _CarScreenState();
}

class _CarScreenState extends ConsumerState<CarScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Kilometraje'),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              ref.read(themeProvider.notifier).update((old) {
                if (old == ThemeMode.dark) {
                  return ThemeMode.light;
                } else {
                  return ThemeMode.dark;
                }
              });
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
          Image.asset(
            theme == ThemeMode.light
                ? AppAssets.appImageCarLight
                : AppAssets.appImageCarDark,
          ),
        ],
      ),
    );
  }
}
