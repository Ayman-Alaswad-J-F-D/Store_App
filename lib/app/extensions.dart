import 'package:flutter/material.dart';

import '../widget/slide_route_animation.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

extension RoundingToTwoDecimalPlacesOnly on double {
  double roundingToTwoDecimal() => ((this * 100).round() / 100);
}

extension NavigatorPush on BuildContext {
  toScreen({required Widget screen}) =>
      Navigator.push(this, SlideRouteAnimation(page: screen));
}

extension NavigatorPushReplacement on BuildContext {
  toScreenReplac({required Widget screen}) => Navigator.pushReplacement(
        this,
        SlideRouteAnimation(page: screen),
      );
}

extension NavigatorPop on BuildContext {
  back() => Navigator.of(this).pop();
}
