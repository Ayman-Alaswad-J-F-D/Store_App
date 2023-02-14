import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/screens/register_screen/cubit/register_cubit.dart';

import '../../../app/constants.dart';
import '../../../widget/cutom_text_field.dart';

class RegisterCardTextFormField extends StatelessWidget {
  const RegisterCardTextFormField({
    Key? key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.nameController,
    required this.phoneController,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;
  final TextEditingController phoneController;

  final GlobalKey formKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterStates>(
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
                    height: 80,
                    child: CustomTextFormField(
                      openEnabled: true,
                      filledNeed: true,
                      fillColor: Colors.grey.shade100,
                      textEditingController: nameController,
                      typeInput: TextInputType.text,
                      label: 'Name',
                      colorLableText: kPrimaryTextColor,
                      prefixIcon: const Icon(
                        FontAwesomeIcons.person,
                        color: kPrimaryColor,
                      ),
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'please enter your name';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 80,
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
                  SizedBox(
                    height: 80,
                    child: CustomTextFormField(
                      openEnabled: true,
                      filledNeed: true,
                      fillColor: Colors.grey.shade100,
                      textEditingController: passwordController,
                      typeInput: TextInputType.visiblePassword,
                      isPassword: RegisterCubit.get(context).isPassword,
                      suffixIcon: RegisterCubit.get(context).suffix,
                      suffixPressed: () => RegisterCubit.get(context)
                          .changePasswordVisisbilaty(),
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
                  SizedBox(
                    height: 80,
                    child: CustomTextFormField(
                      openEnabled: true,
                      filledNeed: true,
                      fillColor: Colors.grey.shade100,
                      textEditingController: phoneController,
                      typeInput: TextInputType.phone,
                      label: 'Phone',
                      colorLableText: kPrimaryTextColor,
                      prefixIcon: const Icon(
                        FontAwesomeIcons.phone,
                        color: kPrimaryColor,
                      ),
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'please enter your phone';
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
