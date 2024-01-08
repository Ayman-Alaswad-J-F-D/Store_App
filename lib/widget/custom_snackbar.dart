import 'package:flutter/material.dart';

import '../theme/colors.dart';

SnackBar customSnackBar({
  required final String text,
  final int duration = 4,
  final ToastStates backgroundColor = ToastStates.SUCCESS,
  final double elevation = 6.0,
  final double padding = 20.0,
}) =>
    SnackBar(
      elevation: elevation,
      content: Text(text),
      padding: EdgeInsets.all(padding),
      duration: Duration(seconds: duration),
      backgroundColor: chooseToastColor(backgroundColor),
    );

// ignore: constant_identifier_names
enum ToastStates { SUCCESS, ERROR, WARNING, NORMAL, DONE }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
    case ToastStates.NORMAL:
      color = AppColors.primaryColor;
      break;
    case ToastStates.DONE:
      color = AppColors.secondPrimaryColor;
  }
  return color;
}
