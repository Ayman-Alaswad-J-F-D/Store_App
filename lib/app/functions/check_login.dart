import 'package:flutter/material.dart';

import '../../helper/local/cache_helper.dart';
import '../../screens/login_screen/login_screen.dart';
import '../../screens/products_screen/products_screen.dart';
import '../constants.dart';

Widget checkLogin(Widget? widget) {
  token = CacheHelper.getData(key: 'token');
  // ignore: unnecessary_null_comparison
  if (token != null) {
    widget = const ProductsScreen();
  } else {
    widget = LoginScreen();
  }
  return widget;
}
