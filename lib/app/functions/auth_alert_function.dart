import 'package:flutter/material.dart';

import '../../../helper/local/cache_helper.dart';
import '../../models/user_model.dart';
import '../../screens/products_screen/products_screen.dart';
import '../../widget/custom_snackbar.dart';
import '../constants/constants.dart';
import '../extensions.dart';
import 'toast_snack_bar.dart';

void authAlertFunction({
  required BuildContext context,
  required UserModel userModel,
}) {
  if (userModel.status!) {
    saveTokenUser(context, userModel);
    context.toScreenReplac(screen: const ProductsScreen());
    toastSnackBar(
      context: context,
      text: userModel.message!,
      backgroundColor: ToastStates.SUCCESS,
    );
  } else {
    // "Something happened, Please try again later.",
    debugPrint(userModel.message);
    toastSnackBar(
      context: context,
      text: userModel.message!,
      backgroundColor: ToastStates.WARNING,
    );
  }
}

void saveTokenUser(BuildContext context, UserModel userModel) async {
  await CacheHelper.saveData(
    key: "Token",
    value: userModel.data?.token,
  ).then((_) => token = userModel.data!.token);
  debugPrint("NEW TOKEN : $token");
}
