import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:store_app/app/constants.dart';
import 'package:store_app/helper/local/cache_helper.dart';

import 'package:store_app/screens/login_screen/cubit/login_cubit.dart';
import 'package:store_app/screens/login_screen/login_screen.dart';
import 'package:store_app/screens/products_screen/products_screen.dart';
import 'package:store_app/screens/register_screen/cubit/register_cubit.dart';

import 'app/cubit/app_cubit.dart';
import 'bloc_observer.dart';

void main() async {
  await GetStorage.init();
  Widget widget;
  token = CacheHelper.getData(key: 'token');

  if (token != '') {
    widget = const ProductsScreen();
  } else {
    widget = LoginScreen();
  }

  Bloc.observer = MyBlocObserver();
  // runApp(DevicePreview(builder: (context) => StoreApp(startScreen: widget)));
  runApp(StoreApp(startScreen: widget));
}

class StoreApp extends StatelessWidget {
  const StoreApp({Key? key, required this.startScreen}) : super(key: key);

  final Widget startScreen;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()),
        BlocProvider(create: (context) => LoginCupit()),
        BlocProvider(create: (context) => RegisterCubit()),
      ],
      child: BlocBuilder<AppCubit, AppStates>(
        builder: (context, state) {
          return MaterialApp(
            // builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            // home: ProductsScreen(),
            home: startScreen,
          );
        },
      ),
    );
  }
}
