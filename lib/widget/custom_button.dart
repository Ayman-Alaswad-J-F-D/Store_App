import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../app/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.text = '',
    required this.onTap,
    this.height = 20,
    this.fontSize = 16,
    this.backgroundColor,
    this.colorText,
    this.trueChild = false,
    this.child,
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;
  final double height;
  final double fontSize;
  final Color? backgroundColor;
  final Color? colorText;
  final bool trueChild;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: trueChild
          ? child
          : DefaultTextStyle(
              style: TextStyle(
                fontSize: fontSize,
                color: colorText ?? kPrimaryTextColor,
              ),
              child: AnimatedTextKit(
                animatedTexts: [WavyAnimatedText(text)],
                pause: const Duration(seconds: 5),
                repeatForever: true,
              ),
            ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: height),
        onPrimary: kLightGrayColor,
        minimumSize: const Size(double.infinity, 0),
        primary: backgroundColor ?? kWhiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
      ),
    );
  }
}
