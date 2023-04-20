import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'app/constants.dart';
import 'helper/local/cache_helper.dart';
import 'screens/login_screen/cubit/login_cubit.dart';
import 'screens/register_screen/cubit/register_cubit.dart';
import 'screens/splash_screen/splash_screen.dart';
import 'app/cubit/app_cubit.dart';
import 'app/functions/check_login.dart';
import 'bloc_observer.dart';

void main() async {
  await GetStorage.init();
  Widget? widget;
  token = CacheHelper.getData(key: 'token');

  Bloc.observer = MyBlocObserver();
  runApp(StoreApp(startScreen: checkLogin(widget)));

  // runApp(DevicePreview(builder: (context) => StoreApp(startScreen: widget)));
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
            home: SplashScreen(startScreen: startScreen),
          );
        },
      ),
    );
  }
}
