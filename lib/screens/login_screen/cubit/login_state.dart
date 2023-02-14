part of 'login_cubit.dart';

@immutable
abstract class LoginStates {}

class LoginInitial extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final UserModel userModel;

  LoginSuccessState({required this.userModel});
}

class LoginErrorState extends LoginStates {
  final String error;
  LoginErrorState(this.error);
}

class LoginLoadingUserDataState extends LoginStates {}

class LoginSuccessUserDataState extends LoginStates {
  final UserModel userModel;

  LoginSuccessUserDataState({required this.userModel});
}

class LoginErrorUserDataState extends LoginStates {}

class ChangePasswordVisibilityState extends LoginStates {}
