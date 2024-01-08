import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class CustomAnimatedText extends StatelessWidget {
  const CustomAnimatedText({
    Key? key,
    required this.animatedtext,
    this.pause = const Duration(milliseconds: 1000),
    this.textStyle,
    this.typeAnimation,
  }) : super(key: key);

  final String animatedtext;
  final Duration pause;
  final TextStyle? textStyle;
  final AnimatedText? typeAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      // WavyAnimatedText
      // FadeAnimatedText
      // TyperAnimatedText
      // ScaleAnimatedText
      // RotateAnimatedText
      // FlickerAnimatedText
      // ColorizeAnimatedText
      animatedTexts: [
        typeAnimation ?? WavyAnimatedText(animatedtext, textStyle: textStyle)
      ],
      pause: pause,
      repeatForever: true,
    );
  }
}
