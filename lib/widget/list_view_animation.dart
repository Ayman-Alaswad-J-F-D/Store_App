import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ListViewAnimation extends StatelessWidget {
  const ListViewAnimation({
    Key? key,
    required this.index,
    required this.child,
    this.verticalOffset,
    this.horizontalOffset,
    this.flipAxis = FlipAxis.x,
  }) : super(key: key);

  final int index;
  final Widget child;
  final double? verticalOffset;
  final double? horizontalOffset;
  final FlipAxis flipAxis;

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: index,
      delay: const Duration(milliseconds: 100),
      child: SlideAnimation(
        duration: const Duration(milliseconds: 2500),
        curve: Curves.fastLinearToSlowEaseIn,
        horizontalOffset: horizontalOffset,
        verticalOffset: verticalOffset,
        child: FlipAnimation(
          duration: const Duration(milliseconds: 2500),
          curve: Curves.fastLinearToSlowEaseIn,
          flipAxis: flipAxis,
          child: child,
        ),
      ),
    );
  }
}
