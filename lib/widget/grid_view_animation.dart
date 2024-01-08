import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class GridViewAnimation extends StatelessWidget {
  const GridViewAnimation({Key? key, required this.index, required this.child})
      : super(key: key);

  final int index;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredGrid(
      position: index,
      columnCount: 1,
      // duration: const Duration(milliseconds: 1500),
      // delay: const Duration(milliseconds: 500),
      child: SlideAnimation(
        verticalOffset: 350,
        duration: const Duration(milliseconds: 2500),
        delay: const Duration(milliseconds: 250),
        curve: Curves.fastLinearToSlowEaseIn,
        child: child,
        //  FlipAnimation(
        //   flipAxis: FlipAxis.y,
        //   duration: const Duration(milliseconds: 2000),
        //   curve: Curves.fastLinearToSlowEaseIn,
        //   child: child,
        // ),
      ),
    );
  }
}
