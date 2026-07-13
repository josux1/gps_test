import 'package:flutter/material.dart';

class AppText {
  AppText._();

  //All of the app texts goes here

  // Titles
  static const TextStyle title = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subtitle = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle subtitleLight = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  // Text
  static const TextStyle text = TextStyle(
    fontFamily: 'WorkSans',
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle textLight = TextStyle(
    fontFamily: 'WorkSans',
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  );

  static const TextStyle textLightBold = TextStyle(
    fontFamily: 'WorkSans',
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}
