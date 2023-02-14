import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/screens/register_screen/components/register_bottom.dart';
import 'package:store_app/screens/register_screen/components/register_card_text_form_field.dart';
import 'package:store_app/screens/register_screen/cubit/register_cubit.dart';
import 'package:store_app/widget/show_toast.dart';

import '../../app/constants.dart';
import '../../app/functions/function_listener_success_state.dart';
import '../../widget/custom_app_bar.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  static const String id = 'RegisterScreen';

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          functionListenerSuccessState(context: context, state: state)
              .then((_) => Navigator.pop(context))
              .then((_) => showToastShort(
                    text: 'Please Login now',
                    state: ToastStates.WARNING,
                  ));
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
                  Text(
                    'Register',
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(fontFamily: 'Pacifico', color: Colors.white),
                  ),
                  const SizedBox(height: 50),
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
                            const SizedBox(height: 10),
                            Text(
                              'Register now to browse our hot offers',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: kGrayColor, fontSize: 15),
                            ),
                            const SizedBox(height: 10),
                            RegisterCardTextFormField(
                              formKey: formKey,
                              emailController: emailController,
                              passwordController: passwordController,
                              nameController: nameController,
                              phoneController: phoneController,
                            ),
                            const SizedBox(height: 30),
                            RegisterBottom(
                              formKey: formKey,
                              emailController: emailController,
                              passwordController: passwordController,
                              nameController: nameController,
                              phoneController: phoneController,
                              state: state,
                            ),
                            const SizedBox(height: 77),
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
