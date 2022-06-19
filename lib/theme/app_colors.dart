import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color white = Color(0xFFFDFDFD);
  static const Color matterhorn = Color(0xFF49383E);
  static const Color green = Color(0xFF6FCF97);
  static const int _orangeTangoBase = 0xFFED841A;

  static const orangeTango = MaterialColor(
    _orangeTangoBase,
    <int, Color>{
      50: Color(0xFFfefde8),
      100: Color(0xFFfcfac6),
      200: Color(0xFFfaf6a0),
      300: Color(0xFFf8f27b),
      400: Color(0xFFf5ed5d),
      500: Color(0xFFf2e841),
      600: Color(0xFFf5da3e),
      700: Color(0xFFf3c235),
      800: Color(0xFFf1ab2b),
      900: Color(_orangeTangoBase),
    },
  );
}
