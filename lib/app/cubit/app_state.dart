part of 'app_cubit.dart';

@immutable
abstract class AppStates {}

class AppInitial extends AppStates {}

class ProductsLoadingState extends AppStates {}

class ProductsSuccessState extends AppStates {}

class ProductsErrorState extends AppStates {}

class CheckConnectionState extends AppStates {}

class ChangeFavoriteState extends AppStates {}

class ImagePickerState extends AppStates {}

class InsertDatabaseState extends AppStates {}

class UpdateDatabaseState extends AppStates {}

class DeleteDatabaseState extends AppStates {}
