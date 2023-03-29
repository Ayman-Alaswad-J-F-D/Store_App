import 'package:flutter/material.dart';

import '../app/constants.dart';

// ignore: non_constant_identifier_names
SnackBar CustomSnakBar({
  required String text,
  Color backgroundColor = kPrimaryColor,
}) {
  return SnackBar(
    content: Text(text),
    backgroundColor: backgroundColor,
    elevation: 8,
  );
}
