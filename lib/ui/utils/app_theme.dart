import 'package:flutter/material.dart';
import 'package:gps_test/ui/utils/app_colors.dart';

final _textTheme = TextTheme(
  // Titles
  displayLarge: TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.bold),
  titleLarge: TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.bold),
  titleMedium: TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.w600),

  // Text
  bodyLarge: TextStyle(fontFamily: 'WorkSans', fontWeight: FontWeight.normal),
  bodyMedium: TextStyle(fontFamily: 'WorkSans', fontWeight: FontWeight.normal),

  // Buttons
  labelLarge: TextStyle(fontFamily: 'WorkSans', fontWeight: FontWeight.w500),
);

class AppTheme {
  AppTheme._();

  static ThemeData lighTheme() {
    return ThemeData(colorSchemeSeed: AppColors.primary, textTheme: _textTheme);
  }

  static ThemeData darkTheme() {
    return ThemeData(
      colorSchemeSeed: AppColors.primary,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: AppBarTheme(backgroundColor: AppColors.background),
      textTheme: _textTheme,
    );
  }
}
