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
      columnCount: 2,
      child: ScaleAnimation(
        duration: const Duration(milliseconds: 900),
        scale: 1.5,
        curve: Curves.fastLinearToSlowEaseIn,
        child: FadeInAnimation(
          child: child,
        ),
      ),
    );
  }
}
