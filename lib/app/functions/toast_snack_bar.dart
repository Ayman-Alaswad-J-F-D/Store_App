import 'package:flutter/material.dart';

import '../../widget/custom_snackbar.dart';

void toastSnackBar({
  required BuildContext context,
  required String text,
  double padding = 16,
  double elevation = 6.0,
  ToastStates backgroundColor = ToastStates.NORMAL,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    customSnackBar(
      text: text,
      padding: padding,
      backgroundColor: backgroundColor,
      elevation: elevation,
    ),
  );
}
