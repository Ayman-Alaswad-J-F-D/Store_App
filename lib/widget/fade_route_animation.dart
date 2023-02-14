import 'package:flutter/material.dart';

class FadeRouteAnimation extends PageRouteBuilder {
  final Widget page;
  // final Widget? route;

  FadeRouteAnimation({
    required this.page,
    // this.route,
  }) : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 1000),
          reverseTransitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
              parent: animation,
              curve: Curves.fastLinearToSlowEaseIn,
              reverseCurve: Curves.fastOutSlowIn,
            );
            return SlideTransition(
              textDirection: TextDirection.rtl,
              position: Tween(
                begin: const Offset(1.0, 0.0),
                end: const Offset(0.0, 0.0),
              ).animate(animation),
              // alignment: Alignment.centerLeft,
              child: page,
            );
          },
        );
}
