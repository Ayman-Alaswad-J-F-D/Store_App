import '../../models/user_model.dart';

/// class user data, this class is used for user data that [passed]
/// from the user [login] or if it is [registered] to view the user data
/// in the entire application side.
class UserData {
  //? Make this a singleton class
  const UserData._privateConstructor();
  static const UserData instance = UserData._privateConstructor();

  static UserModel? _userModel;

  UserModel? get getUserData => _userModel;
  set setUserData(UserModel userData) => _userModel = userData;

  static void clearUserData() => _userModel = null;
}
