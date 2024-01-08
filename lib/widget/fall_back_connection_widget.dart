import 'package:flutter/material.dart';

import '../app/constants/constants.dart';
import '../theme/colors.dart';
import 'custom_button.dart';

class FallBackWidget extends StatelessWidget {
  const FallBackWidget({
    Key? key,
    required this.text,
    this.colorText = AppColors.secondPrimaryColor,
    this.colorButton = AppColors.primaryColor,
    this.onTap,
  }) : super(key: key);

  final String text;
  final Function()? onTap;
  final Color? colorText;
  final Color colorButton;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: colorText,
              fontFamily: 'Pacifico',
            ),
          ),
          const SizedBox(height: 20),
          if (onTap != null)
            SizedBox(
              width: widthScreen(context) / 1.8,
              child: CustomButton(
                text: "Try again",
                backgroundColor: colorButton,
                colorText: AppColors.yallowColor,
                onTap: onTap!,
              ),
            ),
        ],
      ),
    );
  }
}
