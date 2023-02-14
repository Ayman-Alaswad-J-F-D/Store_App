// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../helper/remote/users_api.dart';
import '../../../models/user_model.dart';
import '../../../services/end point/users_end_point.dart';

part 'login_state.dart';

class LoginCupit extends Cubit<LoginStates> {
  LoginCupit() : super(LoginInitial());

  static LoginCupit get(context) => BlocProvider.of(context);

  UserModel? userModel;

  void userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    await UsersApi.post(
      url: LOGIN,
      body: {'email': email, 'password': password},
    ).then(
      (value) {
        userModel = UserModel.fromJson(value);
        print(userModel?.status);
        print(userModel?.message);
        print(userModel?.data?.name);
        print(userModel?.data?.token);

        emit(LoginSuccessState(userModel: userModel!));
      },
    ).catchError((error) {
      print(error);
      emit(LoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changePasswordVisisbilaty() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }
}
