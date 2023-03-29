import 'package:flutter/material.dart';
import 'package:store_app/app/cubit/app_cubit.dart';

import '../../widget/custom_show_dialog_content.dart';
import '../constants.dart';

Future<dynamic> showDialogDetailsCard(BuildContext context, int index) {
  return showDialog(
    barrierDismissible: false,
    useRootNavigator: false,
    context: context,
    builder: (context) {
      if (AppCubit.get(context).cardUser.isNotEmpty) {
        return CustomShowDialogContent(index: index);
      } else {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 300, horizontal: 40),
          child: Center(
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'You haven\'t added the product yet',
                  style: TextStyle(color: kPrimaryColor, fontSize: 16),
                ),
              ),
            ),
          ),
        );
      }
    },
  );
}
