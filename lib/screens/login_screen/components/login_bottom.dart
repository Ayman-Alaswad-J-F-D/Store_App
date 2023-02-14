// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';

import '../../../app/constants.dart';
import '../../../widget/custom_button.dart';
import '../cubit/login_cubit.dart';

class LoginBottom extends StatelessWidget {
  const LoginBottom({
    Key? key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.state,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final LoginStates state;

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: state is! LoginLoadingState,
      builder: (context) => CustomButton(
        text: 'Login',
        height: 18,
        backgroundColor: kPrimaryColor,
        colorText: kWhiteColor,
        onTap: () {
          if (formKey.currentState!.validate()) {
            LoginCupit.get(context).userLogin(
              email: emailController.text,
              password: passwordController.text,
            );
          }
        },
      ),
      fallback: (context) => CustomButton(
        trueChild: true,
        height: 18,
        backgroundColor: kPrimaryColor,
        child: const SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(strokeWidth: 3, color: kWhiteColor),
        ),
        onTap: () {},
      ),
    );
  }
}
