// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:store_app/screens/splash_screen/splash_screen.dart';

import '../../helper/local/cache_helper.dart';
import '../../screens/auth/login_screen/login_screen.dart';
import '../../screens/products_screen/products_screen.dart';
import '../constants/constants.dart';

Widget checkLogin() {
  final Widget startScreen;
  token = CacheHelper.getData(key: "Token");
  print("Token is : $token");

  if (token != null) {
    print("Products Screen");
    startScreen = const ProductsScreen();
  } else {
    print("Login Screen");
    startScreen = const LoginScreen();
  }
  return SplashScreen(startScreen: startScreen);
}
