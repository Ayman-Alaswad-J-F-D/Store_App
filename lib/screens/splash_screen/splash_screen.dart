import 'package:flutter/material.dart';
import 'package:store_app/app/constants.dart';
import 'package:store_app/widget/fade_route_animation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key, required this.startScreen}) : super(key: key);
  final Widget startScreen;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        FadeRouteAnimation(page: widget.startScreen),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Center(child: Image.asset('assets/images/icon_app.jpg', scale: 3)),
    );
  }
}
