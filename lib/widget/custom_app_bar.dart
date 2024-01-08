import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/colors.dart';
import '../theme/styles.dart';

// ignore: non_constant_identifier_names
AppBar CustomAppBar({
  required String textTitle,
  List<Widget>? actionWidget,
  Widget? leadingWidget,
  Radius radius = const Radius.circular(30),
}) =>
    AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: AppColors.primaryColor,
      surfaceTintColor: AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: radius),
      ),
      leading: leadingWidget,
      foregroundColor: AppColors.whiteColor,
      elevation: 0,
      title: Text(
        textTitle,
        maxLines: 2,
        style: TextStyles.pacifico14WhiteRegular,
      ),
      centerTitle: true,
      actions: actionWidget,
    );
