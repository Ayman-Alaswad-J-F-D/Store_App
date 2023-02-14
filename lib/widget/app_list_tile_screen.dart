import 'package:flutter/material.dart';

import '../app/constants.dart';

class AppListTileScreen extends StatelessWidget {
  const AppListTileScreen({
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
      selected: currentScreen == index ? true : false,
      selectedColor: kPrimaryColor,
      selectedTileColor: kLightPrimaryColor,
      style: ListTileStyle.drawer,
      leading: Icon(icon),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, color: kSecondPrimaryColor),
      ),
      onTap: currentScreen == index ? () => Navigator.pop(context) : onTap,
    );
  }
}
