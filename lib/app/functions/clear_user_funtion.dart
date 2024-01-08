import 'package:flutter/material.dart';
import 'package:store_app/app/constants/constants.dart';
import 'package:store_app/app/cubit/app_cubit.dart';
import 'package:store_app/app/userdata/class_user_data.dart';
import 'package:store_app/helper/local/cache_helper.dart';

void clearUser(BuildContext context) {
  //* Clear user Data
  UserData.clearUserData();
  //* Clear cached user Data
  CacheHelper.removeData(key: "UserData");
  //* Clear token
  CacheHelper.removeData(key: "Token").then((_) => token = "");
  //* Clear favorite
  AppCubit.get(context).cachedFavorite.clear();
}
