// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:store_app/app/cubit/app_cubit.dart';
import 'package:store_app/screens/products_screen/products_screen.dart';
import 'package:store_app/widget/fade_route_animation.dart';

import '../../../app/constants.dart';
import '../../../helper/local/cache_helper.dart';
import '../../../widget/show_toast.dart';

Future<void> functionListenerSuccessState({
  required BuildContext context,
  required var state,
}) async {
  if (state.userModel.status == true) {
    print(state.userModel.message);
    print(state.userModel.data?.token);
    await CacheHelper.saveData(
      key: 'token',
      value: state.userModel.data?.token,
    ).then((value) {
      AppCubit.get(context).myFavorites.clear();
      token = state.userModel.data!.token;
      print(token);
      Navigator.pushReplacement(
        context,
        FadeRouteAnimation(page: const ProductsScreen()),
      );
    }).catchError((e) {
      showToastLong(text: e.toString(), state: ToastStates.ERROR);
    });
    showToastLong(text: state.userModel.message!, state: ToastStates.SUCCESS);
  } else {
    print(state.userModel.message);
    showToastLong(text: state.userModel.message!, state: ToastStates.ERROR);
  }
}
