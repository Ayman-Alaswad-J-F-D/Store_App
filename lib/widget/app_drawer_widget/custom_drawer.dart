import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/constants/constants.dart';
import '../../app/extensions.dart';
import '../../app/functions/clear_user_funtion.dart';
import '../../screens/about_screen/about_screen.dart';
import '../../screens/auth/cubit/auth_cubit.dart';
import '../../screens/auth/login_screen/login_screen.dart';
import '../../screens/categories_screen/categories_screen.dart';
import '../../screens/connect_as_screen/connect_as_screen.dart';
import '../../screens/products_screen/products_screen.dart';
import '../../theme/colors.dart';
import 'build_user_account_drawer_header.dart';
import 'drawer_tile_item.dart';
import 'user_info_helper.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.whiteColor,
      surfaceTintColor: AppColors.primaryColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is LoginSuccessState) {
                final userInfoFromLogin = state.userModel.data;
                return BuildUserAccountDrawerHeader(
                  userName: userInfoFromLogin?.name,
                  email: userInfoFromLogin?.email,
                );
              } else if (state is RegisterSuccessState) {
                final userInfoFromRegister = state.userModel.data;
                return BuildUserAccountDrawerHeader(
                  userName: userInfoFromRegister?.name,
                  email: userInfoFromRegister?.email,
                );
              } else {
                return BuildUserAccountDrawerHeader(
                  userName: UserInfoHelper.name,
                  email: UserInfoHelper.email,
                );
              }
            },
          ),
          DrawerTileItem(
            title: "All Product",
            icon: Icons.home_rounded,
            index: 0,
            onTap: () {
              setState(() {
                currentScreen = 0;
              });
              context.toScreenReplac(screen: const ProductsScreen());
            },
          ),
          DrawerTileItem(
            title: "Categories",
            icon: Icons.category_rounded,
            index: 1,
            onTap: () {
              setState(() {
                currentScreen = 1;
              });
              context.toScreenReplac(screen: const CategoriesScreen());
            },
          ),
          DrawerTileItem(
            title: "Connect As",
            icon: Icons.phone,
            index: 2,
            onTap: () {
              setState(() {
                // ? True Line
                currentScreen = 2;
              });
              context.toScreenReplac(screen: const ConnectAsScreen());
            },
          ),
          DrawerTileItem(
            title: "About",
            icon: Icons.info,
            index: 3,
            onTap: () {
              setState(() {
                // ? True Line
                currentScreen = 3;
              });
              context.toScreenReplac(screen: const AboutScreen());
            },
          ),
          DrawerTileItem(
            title: "Logout",
            icon: Icons.logout_rounded,
            index: 4,
            onTap: () {
              setState(() {
                // ? True Line
                currentScreen = 0;
              });
              context.toScreenReplac(screen: const LoginScreen());
              //* Clear user data from class UserData and Cache memory
              clearUser(context);
            },
          ),
        ],
      ),
    );
  }
}
