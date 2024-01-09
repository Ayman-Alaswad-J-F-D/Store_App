import 'package:flutter/material.dart';
import 'package:store_app/theme/colors.dart';

import '../../theme/styles.dart';
import '../custom_animated_text.dart';
import 'account_picture.dart';

class BuildUserAccountDrawerHeader extends StatelessWidget {
  const BuildUserAccountDrawerHeader({
    Key? key,
    required this.userName,
    required this.email,
  }) : super(key: key);

  final String? userName;
  final String? email;

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      margin: EdgeInsets.zero,
      decoration: const BoxDecoration(color: AppColors.primaryColor),
      currentAccountPicture: const AccountPicture(),
      accountName: Text(
        userName ?? "",
        style: TextStyles.pacifico17YallowRegular,
      ),
      accountEmail: email != null
          ? Text(email!, style: TextStyles.font14LightPrimaryRegular)
          : const CustomAnimatedText(animatedtext: "  • • • •"),
    );
  }
}
