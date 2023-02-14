import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../app/constants.dart';
import '../../../widget/cutom_text_field.dart';
import '../cubit/login_cubit.dart';

class LoginCardTextFormField extends StatelessWidget {
  const LoginCardTextFormField({
    Key? key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;

  final GlobalKey formKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCupit, LoginStates>(
      builder: (context, state) {
        return Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 12,
          color: Colors.white,
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 26,
                bottom: 10,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 90,
                    child: CustomTextFormField(
                      openEnabled: true,
                      filledNeed: true,
                      fillColor: Colors.grey.shade100,
                      textEditingController: emailController,
                      typeInput: TextInputType.emailAddress,
                      label: 'E-mail',
                      colorLableText: kPrimaryTextColor,
                      prefixIcon: const Icon(
                        FontAwesomeIcons.user,
                        color: kPrimaryColor,
                      ),
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'please enter your email address';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: 80,
                    child: CustomTextFormField(
                      openEnabled: true,
                      filledNeed: true,
                      fillColor: Colors.grey.shade100,
                      textEditingController: passwordController,
                      typeInput: TextInputType.visiblePassword,
                      isPassword: LoginCupit.get(context).isPassword,
                      suffixIcon: LoginCupit.get(context).suffix,
                      suffixPressed: () =>
                          LoginCupit.get(context).changePasswordVisisbilaty(),
                      label: 'Password',
                      colorLableText: kPrimaryTextColor,
                      prefixIcon: const Icon(
                        FontAwesomeIcons.lock,
                        color: kPrimaryColor,
                      ),
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'please is too short';
                        }
                        return null;
                      },
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
