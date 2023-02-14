import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../app/constants.dart';

class LoginAnotherAccount extends StatelessWidget {
  const LoginAnotherAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FloatingActionButton(
          backgroundColor: kPrimaryColor,
          heroTag: 'facebook',
          mini: true,
          onPressed: () {
            // showToastShort(
            //   text: 'SOON',
            //   state: ToastStates.WARNING,
            // );
          },
          child: const Icon(FontAwesomeIcons.facebook),
        ),
        FloatingActionButton(
          backgroundColor: kPrimaryColor,
          heroTag: 'google',
          mini: true,
          onPressed: () {
            // showToastShort(
            //   text: 'SOON',
            //   state: ToastStates.WARNING,
            // );
          },
          child: const Icon(FontAwesomeIcons.google),
        ),
        FloatingActionButton(
          backgroundColor: kPrimaryColor,
          heroTag: 'gust',
          mini: true,
          onPressed: () {
            // showToastShort(
            //   text: 'SOON',
            //   state: ToastStates.WARNING,
            // );
          },
          child: const Icon(
            FontAwesomeIcons.userGroup,
            size: 15,
          ),
        ),
      ],
    );
  }
}
