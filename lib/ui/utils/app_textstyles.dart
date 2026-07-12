import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();

  //All of the app colors goes here
  static const TextStyle title = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle subtitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle text = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle textLight = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  );
}
