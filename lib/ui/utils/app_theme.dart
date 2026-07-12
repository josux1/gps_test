import 'package:flutter/material.dart';
import 'package:gps_test/ui/utils/app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lighTheme() {
    return ThemeData(colorSchemeSeed: AppColors.primary);
  }

  static ThemeData darkTheme() {
    return ThemeData(
      colorSchemeSeed: AppColors.primary,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: AppBarTheme(backgroundColor: AppColors.background),
    );
  }
}
