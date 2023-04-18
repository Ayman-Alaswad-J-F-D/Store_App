part of 'app_cubit.dart';

@immutable
abstract class AppStates {}

class AppInitial extends AppStates {}

class ProductsLoadingState extends AppStates {}

class ProductsSuccessState extends AppStates {}

class ProductsErrorState extends AppStates {}

class CheckConnectionState extends AppStates {}

class CategoriesLoadingState extends AppStates {}

class CategoriesSuccessState extends AppStates {}

class CategoriesErrorState extends AppStates {}

class CategoriesDetailsLoadingState extends AppStates {}

class CategoriesDetailsSuccessState extends AppStates {}

class CategoriesDetailsErrorState extends AppStates {}

class UserCardLoadingState extends AppStates {}

class UserCardSuccessState extends AppStates {}

class UserCardErrorState extends AppStates {}

class LoadingUserDataState extends AppStates {}

class SuccessUserDataState extends AppStates {
  final UserModel userModel;

  SuccessUserDataState({required this.userModel});
}

class ErrorUserDataState extends AppStates {}

class ChangeFavoretisState extends AppStates {}

class CreateDatabaseState extends AppStates {}

class InsertDatabaseState extends AppStates {}

class GetDatabaseLoadingState extends AppStates {}

class GetDatabaseState extends AppStates {}

class DeleteDatabaseState extends AppStates {}

class UpdateDatabaseState extends AppStates {}

class IncreaseQuantityState extends AppStates {}

class DecreaseQuantityState extends AppStates {}
