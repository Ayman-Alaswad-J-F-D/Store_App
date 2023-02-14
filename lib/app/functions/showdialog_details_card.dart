import 'package:flutter/material.dart';

import '../../widget/custom_show_dialog_content.dart';
import '../constants.dart';
import '../../models/card_model.dart';

Future<dynamic> showDialogDetailsCard(
  BuildContext context,
  CardModel? cardModel,
) {
  return showDialog(
    barrierDismissible: false,
    useRootNavigator: false,
    context: context,
    builder: (context) {
      if (cardModel != null) {
        return CustomShowDialogContent(cardModel: cardModel);
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
