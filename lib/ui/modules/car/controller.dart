import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_test/core/providers/providers.dart';

final carControllerProvider = Provider<CarController>((ref) {
  return CarController(ref: ref);
});

class CarController {
  CarController({required this.ref});
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
}
