import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:gps_test/core/modules/car/repository.dart';
import 'package:riverpod/riverpod.dart';

final themeProvider = StateProvider<ThemeMode>((ref) {
  return ThemeMode.light;
});

final carRepoProvider = Provider<CarRepository>((ref) {
  return CarRepository();
});
