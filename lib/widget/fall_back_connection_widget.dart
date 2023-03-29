import 'package:flutter/material.dart';

import '../app/constants.dart';
import 'custom_button.dart';

class FallBackWidget extends StatelessWidget {
  const FallBackWidget({
    Key? key,
    required this.text,
    this.colorText = kSecondPrimaryColor,
    this.needBottom = true,
    this.onTap,
  }) : super(key: key);

  final String text;
  final Function()? onTap;
  final bool needBottom;
  final Color? colorText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 16, color: colorText),
          ),
          const SizedBox(height: 20),
          needBottom
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: CustomButton(
                    text: "Try again",
                    height: 10,
                    backgroundColor: kPrimaryColor,
                    colorText: kYallowColor,
                    onTap: onTap!,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
