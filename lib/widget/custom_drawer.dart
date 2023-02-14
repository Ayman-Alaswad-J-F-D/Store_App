import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/screens/about_screen/about_screen.dart';
import 'package:store_app/screens/connect_as_screen/connect_as_screen.dart';

// import 'package:image_picker/image_picker.dart';

import '../app/constants.dart';
import '../app/cubit/app_cubit.dart';
import '../helper/local/cache_helper.dart';
import '../screens/categories_screen/categories_screen.dart';
import '../screens/login_screen/cubit/login_cubit.dart';
import '../screens/login_screen/login_screen.dart';
import '../screens/products_screen/products_screen.dart';
import '../screens/register_screen/cubit/register_cubit.dart';
import 'app_list_tile_screen.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<LoginCupit, LoginStates>(
          listener: (context, state) {},
        ),
        BlocListener<RegisterCubit, RegisterStates>(
          listener: (context, state) {},
        ),
      ],
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(30)),
              ),
              currentAccountPicture: const AccountPicture(),
              accountName: Text(
                GetInfoUser.name(context) ?? '',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(
                GetInfoUser.email(context) ?? '',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            AppListTileScreen(
              title: 'All Product',
              icon: Icons.home_rounded,
              index: 0,
              onTap: () {
                setState(() {
                  currentScreen = 0;
                });
                // Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductsScreen(),
                  ),
                );
              },
            ),
            AppListTileScreen(
              title: 'Categories',
              icon: Icons.category_rounded,
              index: 1,
              onTap: () {
                setState(() {
                  currentScreen = 1;
                });
                // Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CategoriesScreen(),
                  ),
                );
              },
            ),
            AppListTileScreen(
              title: 'Connect As',
              icon: Icons.phone,
              index: 3,
              onTap: () {
                setState(() {
                  // ? True Line
                  currentScreen = 3;
                });
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ConnectAsScreen(),
                  ),
                );
              },
            ),
            AppListTileScreen(
              title: 'About',
              icon: Icons.info,
              index: 4,
              onTap: () {
                setState(() {
                  // ? True Line
                  currentScreen = 4;
                });
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutScreen()),
                );
              },
            ),
            // SizedBox(height: MediaQuery.of(context).size.height - 400),
            AppListTileScreen(
              title: 'Logout',
              icon: Icons.logout_rounded,
              index: 2,
              onTap: () {
                setState(() {
                  // ? True Line
                  currentScreen = 0;
                });
                CacheHelper.removeData(key: 'token')
                    .then((value) => token = '');

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),

            //   SizedBox(height: MediaQuery.of(context).size.height * 0.5),
            //   InkWell(
            //     splashColor: kLightPrimaryColor,
            //     onTap: () {
            //       CacheHelper.removeData(key: 'token')
            //           .then((value) => token = '');
            //       Navigator.pushReplacement(
            //         context,
            //         MaterialPageRoute(builder: (context) => LoginScreen()),
            //       );
            //     },
            //     child: Padding(
            //       padding:
            //           const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            //       child: Row(
            //         mainAxisSize: MainAxisSize.min,
            //         children: const [
            //           Icon(Icons.logout_rounded, color: kSecondPrimaryColor),
            //           SizedBox(width: 10),
            //           Text(
            //             'Logout',
            //             style: TextStyle(color: kSecondPrimaryColor),
            //           ),
            //         ],
            //       ),
            //     ),
            //   )
          ],
        ),
      ),
    );
  }

  // File? image;
  // Future pickImage(ImageSource source) async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: source);
  //     if (image == null) return;
  //     final imageTemporary = File(image.path);
  //     setState(() => this.image = imageTemporary);
  //   } on Platform catch (e) {
  //     // ignore: avoid_print
  //     print('Failed to pick image : $e');
  //   }
  // }
}

class AccountPicture extends StatelessWidget {
  const AccountPicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundColor: kWhiteColor,

          backgroundImage: GetInfoUser.image(context) != null
              ? NetworkImage(GetInfoUser.image(context)!)
              : null,

          // ??  FileImage(image) as ImageProvider,

          child: GetInfoUser.image(context) == null
              ? const Icon(Icons.person, color: kPrimaryColor, size: 50)
              : null,
        ),
        Positioned(
          left: 52,
          bottom: 52,
          child: CircleAvatar(
            backgroundColor: kSecondPrimaryColor,
            radius: 10,
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              // showOption(context),
              icon: const Icon(Icons.edit, size: 12, color: kWhiteColor),
            ),
          ),
        ),
      ],
    );
  }
}

class GetInfoUser {
  static String? name(BuildContext context) {
    return LoginCupit.get(context).userModel?.data?.name ??
        RegisterCubit.get(context).userModel?.data?.name ??
        AppCubit.get(context).userModel?.data?.name;
  }

  static String? email(BuildContext context) {
    return LoginCupit.get(context).userModel?.data?.email ??
        RegisterCubit.get(context).userModel?.data?.email ??
        AppCubit.get(context).userModel?.data?.email;
  }

  static String? image(BuildContext context) {
    return LoginCupit.get(context).userModel?.data?.image ??
        RegisterCubit.get(context).userModel?.data?.image ??
        AppCubit.get(context).userModel?.data?.image;
  }
}

// showOption(BuildContext context) {
//   return showDialog(
//     barrierColor: Colors.black38,
//     context: context,
//     builder: (context) => AlertDialog(
//       title: const Text(
//         'Make a choice',
//       ),
//       content: SingleChildScrollView(
//         child: Column(
//           children: [
//             ListTile(
//               leading: const Icon(Icons.image_outlined, color: kPrimaryColor),
//               title: const Text(
//                 'Gallery',
//                 style: TextStyle(color: kPrimaryColor),
//               ),
//               onTap: () {
//                 _CustomDrawerState().pickImage(ImageSource.gallery);
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading:
//                   const Icon(Icons.camera_alt_outlined, color: kPrimaryColor),
//               title: const Text(
//                 'Camera',
//                 style: TextStyle(color: kPrimaryColor),
//               ),
//               onTap: () {
//                 _CustomDrawerState().pickImage(ImageSource.camera);
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
