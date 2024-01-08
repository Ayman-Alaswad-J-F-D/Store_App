import 'package:flutter/material.dart';

import '../theme/colors.dart';
import 'custom_animated_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.text = '',
    this.onTap,
    this.height = 10,
    this.fontSize = 16,
    this.backgroundColor,
    this.colorText,
    this.trueChild = false,
    this.child,
    this.duration = 5,
  }) : super(key: key);

  final String text;
  final VoidCallback? onTap;
  final double height;
  final double fontSize;
  final Color? backgroundColor;
  final Color? colorText;
  final bool trueChild;
  final Widget? child;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: trueChild
          ? child
          : DefaultTextStyle(
              style: TextStyle(
                fontSize: fontSize,
                color: colorText ?? AppColors.secondPrimaryColor,
                fontFamily: 'Pacifico',
              ),
              child: CustomAnimatedText(
                animatedtext: text,
                pause: Duration(seconds: duration),
              ),
            ),
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.lightGrayColor,
        backgroundColor: backgroundColor ?? AppColors.whiteColor,
        padding: EdgeInsets.symmetric(vertical: height),
        minimumSize: const Size(double.infinity, 0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
      ),
    );
  }
}
