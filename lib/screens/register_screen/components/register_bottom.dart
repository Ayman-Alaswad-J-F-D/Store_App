// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';

import '../../../app/constants.dart';
import '../../../widget/custom_button.dart';

import '../cubit/register_cubit.dart';

class RegisterBottom extends StatelessWidget {
  const RegisterBottom({
    Key? key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.nameController,
    required this.phoneController,
    required this.state,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final RegisterStates state;

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: state is! RegisterLoadingState,
      builder: (context) => CustomButton(
        text: 'Register',
        height: 18,
        backgroundColor: kPrimaryColor,
        colorText: kWhiteColor,
        onTap: () {
          if (formKey.currentState!.validate()) {
            RegisterCubit.get(context).userRegister(
              name: nameController.text,
              email: emailController.text,
              password: passwordController.text,
              phone: phoneController.text,
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
