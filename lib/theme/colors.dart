import 'package:flutter/material.dart';

class AppColors {
  static const whiteColor = Color(0xffffffff);
  static const primaryColor = Color(0xff355764);
  static const secondPrimaryColor = Color(0xff5A8F7B);
  static const lightPrimaryColor = Color(0xffCFD8DC);
  static const yallowColor = Color(0xffFFEA11);
  static const grayColor = Color(0xff757575);
  static const lightGrayColor = Color(0xffE0E0E0);
  static const iconLoveColor = Colors.red;

  static const MaterialColor primary =
      MaterialColor(_primaryValue, <int, Color>{
    50: Color(0xFFE7EBEC),
    100: Color(0xFFC2CDD1),
    200: Color(0xFF9AABB2),
    300: Color(0xFF728993),
    400: Color(0xFF53707B),
    500: Color(_primaryValue),
    600: Color(0xFF304F5C),
    700: Color(0xFF284652),
    800: Color(0xFF223C48),
    900: Color(0xFF162C36),
  });
  static const int _primaryValue = 0xFF355764;
}
