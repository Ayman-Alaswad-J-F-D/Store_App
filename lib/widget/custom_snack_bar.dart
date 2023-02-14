import 'package:flutter/material.dart';

import '../app/constants.dart';

// ignore: non_constant_identifier_names
SnackBar CustomSnakBar({required String text}) {
  return SnackBar(
    content: Text(text),
    backgroundColor: kPrimaryColor,
    elevation: 8,
  );
}
