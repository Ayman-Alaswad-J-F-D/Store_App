import 'package:flutter/material.dart';

import '../../../app/constants.dart';
import 'custom_card.dart';

class CustomImageNetwork extends StatelessWidget {
  const CustomImageNetwork({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final CustomCard widget;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 30,
      top: -75,
      child: Hero(
        tag: widget.product.id,
        child: Image.network(
          widget.product.image,
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width * 0.26,
          errorBuilder: (
            BuildContext context,
            Object error,
            StackTrace? stackTrace,
          ) {
            return const Padding(
              padding: EdgeInsets.only(top: 30, right: 40),
              child: CircularProgressIndicator(color: kSecondPrimaryColor),
            );
          },
        ),
      ),
    );
  }
}
