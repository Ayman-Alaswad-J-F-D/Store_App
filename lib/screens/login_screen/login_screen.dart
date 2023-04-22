// ignore_for_file: avoid_print, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/constants.dart';
import '../../app/functions/function_listener_success_state.dart';
import '../../widget/custom_app_bar.dart';
import '../../widget/fade_route_animation.dart';
import '../../widget/show_toast.dart';
import '../products_screen/products_screen.dart';
import '../register_screen/register_screen.dart';
import 'components/login_card_text_form_field.dart';
import 'components/login_another_account.dart';
import 'components/login_bottom.dart';
import 'cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  static const String id = 'LoginSceen';

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCupit, LoginStates>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          functionListenerSuccessState(context: context, state: state).then(
            (value) => value
                ? Navigator.pushReplacement(
                    context,
                    FadeRouteAnimation(page: const ProductsScreen()),
                  )
                : null,
          );
        }
        if (state is LoginErrorState) {
          print(state.error);
          showToastLong(text: state.error, state: ToastStates.ERROR);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(textTitle: ""),
          backgroundColor: kPrimaryColor,
          body: SafeArea(
            minimum: const EdgeInsets.only(top: 28),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(fontSize: 60, color: kWhiteColor),
                  ),
                  const SizedBox(height: 80),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const SizedBox(height: 15),
                            Text(
                              'Login now to browse our hot offers',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: kGrayColor, fontSize: 15),
                            ),
                            const SizedBox(height: 15),
                            LoginCardTextFormField(
                              formKey: formKey,
                              emailController: emailController,
                              passwordController: passwordController,
                            ),
                            const SizedBox(height: 30),
                            LoginBottom(
                              formKey: formKey,
                              emailController: emailController,
                              passwordController: passwordController,
                              state: state,
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Don\'t have an accuont ?'),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      FadeRouteAnimation(
                                        page: RegisterScreen(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Register',
                                    style: TextStyle(
                                      color: kPrimaryTextColor,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Expanded(
                                  child: Divider(
                                    indent: 15,
                                    endIndent: 20,
                                    color: Colors.black38,
                                  ),
                                ),
                                Text('or'),
                                Expanded(
                                  child: Divider(
                                    indent: 20,
                                    endIndent: 15,
                                    color: Colors.black38,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 25),
                            const LoginAnotherAccount(),
                            const SizedBox(height: 9),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
