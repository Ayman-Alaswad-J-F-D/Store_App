import 'package:flutter/material.dart';

import '../app/constants.dart';
import 'custom_button.dart';

class FallBackWidget extends StatelessWidget {
  const FallBackWidget({
    Key? key,
    required this.text,
    this.needBottom = true,
    @required this.onTap,
  }) : super(key: key);
  final String text;
  final Function()? onTap;
  final bool needBottom;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              color: kSecondPrimaryColor,
            ),
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
