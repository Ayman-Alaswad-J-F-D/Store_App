import 'package:flutter/material.dart';
import 'package:store_app/app/extensions.dart';

import '../../app/constants/constants.dart';
import '../../theme/colors.dart';
import '../../theme/styles.dart';

class DrawerTileItem extends StatelessWidget {
  const DrawerTileItem({
    Key? key,
    required this.index,
    required this.onTap,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final int index;
  final String title;
  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: currentScreen == index,
      selectedColor: AppColors.primaryColor,
      selectedTileColor: AppColors.lightPrimaryColor,
      style: ListTileStyle.drawer,
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyles.pacifico16SecondPrimaryRegular,
      ),
      onTap: currentScreen == index ? () => context.back() : onTap,
    );
  }
}
