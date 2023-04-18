import 'package:flutter/material.dart';

import '../app/constants.dart';

// ignore: non_constant_identifier_names
SnackBar CustomSnakBar({
  required Widget child,
  double elevation = 8,
  Color backgroundColor = kPrimaryColor,
}) {
  return SnackBar(
    content: child,
    elevation: elevation,
    backgroundColor: backgroundColor,
  );
}
