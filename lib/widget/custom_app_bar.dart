import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../app/constants.dart';

// ignore: non_constant_identifier_names
AppBar CustomAppBar({required String textTitle, List<Widget>? actionWidget}) =>
    AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: kPrimaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      elevation: 0,
      title: Text(
        textTitle,
        style: const TextStyle(color: kWhiteColor),
      ),
      centerTitle: true,
      actions: actionWidget,
    );
