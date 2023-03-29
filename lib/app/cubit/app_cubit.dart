// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sqflite/sqflite.dart';
import 'package:store_app/models/card_user_model.dart';

import '../../../models/card_model.dart';
import '../../../models/user_model.dart';
import '../../../services/all_product_service.dart';
import '../../helper/local/cache_helper.dart';
import '../../helper/remote/users_api.dart';
import '../../models/catefories_model.dart';
import '../../models/product_model.dart';
import '../../services/all_categories_srevice.dart';
import '../../services/categories_service.dart';
import '../../services/end point/users_end_point.dart';
import '../../services/get_user_cart_service.dart';
import '../constants.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);

  List<ProductModel>? listProduct;
  List<CategoriesModel>? listCategoriesDetails;
  List<CardModel>? listCardUsersModel;
  List<dynamic>? listCategories;

  UserModel? userModel;

  int quantity = 1;
  List<dynamic> myFavorites = CacheHelper.getData(key: 'Favorites') ?? [];

  Future<void> getUserData() async {
    emit(LoadingUserDataState());
    await UsersApi.get(
      url: PROFILE,
      token: token,
    ).then((value) {
      userModel = UserModel.fromJson(value);
      // printFullText(value.data);
      print('status is User Data ${userModel?.status}');
      print(userModel?.data?.name);

      emit(SuccessUserDataState(userModel: userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ErrorUserDataState());
    });
  }

  final InternetConnectionChecker connectionChecker =
      InternetConnectionChecker();

  void getProductsData() async {
    emit(ProductsLoadingState());

    if (await connectionChecker.hasConnection) {
      AllProductService.getAllProduct().then((value) {
        listProduct = value;
        print(listProduct?[0].title);
        print(listProduct?[0].category);
        print(listProduct?[0].price);

        emit(ProductsSuccessState());
      }).then((value) {
        // * Get User Data
        if (userModel == null) {
          getUserData();
        }
        // * Get Categories Data
        if (listCategories == null) {
          getCategoriesData();
        }
      }).catchError((error) {
        print(error.toString());
        emit(ProductsErrorState());
      });
    } else {
      Future.delayed(const Duration(milliseconds: 500), () {
        emit(CheckConnectionState());
      });
    }
  }

  Future<void> getCategoriesData() async {
    emit(CategoriesLoadingState());
    await AllCategoriesSrevice.getAllCategories().then((value) {
      listCategories = value;
      emit(CategoriesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CategoriesErrorState());
    });
  }

  void getCategoriesDetails({required String categoryName}) async {
    emit(CategoriesDetailsLoadingState());

    if (await connectionChecker.hasConnection) {
      CategoriesService.getCategoriesProduct(categoryName: categoryName)
          .then((value) {
        listCategoriesDetails = value;
        print(value[0].title);
        print(value[0].price);
        print(value[0].category);

        emit(CategoriesDetailsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(CategoriesDetailsErrorState());
      });
    } else {
      Future.delayed(const Duration(milliseconds: 500), () {
        emit(CheckConnectionState());
      });
    }
  }

  void getUserCard({required String userId}) async {
    emit(UserCardLoadingState());
    if (await connectionChecker.hasConnection) {
      GetUserCart.getUserCart(userId: userId).then((value) {
        listCardUsersModel = value;
        print(value[0].product?[0].productId);
        print(value[0].product?[0].quantity);
        emit(UserCardSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(UserCardErrorState());
      });
    } else {
      Future.delayed(const Duration(milliseconds: 500), () {
        emit(CheckConnectionState());
      });
    }
  }

  // Future<void> addToCard(ProductModel product, context) async {
  //   showDialog(
  //     barrierDismissible: false,
  //     context: context,
  //     builder: (builder) {
  //       return const CustomCircularProgress();
  //     },
  //   );
  //   cardModel = await AddToCard.addToCard(
  //     userId: userModel?.data?.id.toString() ?? "5",
  //     dataTime: DateTime.now().toString(),
  //     productsId: product.id.toString(),
  //     quantity: quantity.toString(),
  //   );
  // }

  // Future<void> updateProduct(ProductModel product) async {
  //   await UpdateProductService.updateProduct(
  //     id: product.id,
  //     title: productName ?? product.title,
  //     price: price ?? product.price.toString(),
  //     description: description ?? product.description,
  //     image: image ?? product.image,
  //     categories: product.category,
  // rate: product.rating.rate,
  // count: product.rating.count,
  //   );
  // }

  Future<void> changeFavoritess(int productId) async {
    if (myFavorites.contains(productId)) {
      myFavorites.remove(productId);
      print(myFavorites);

      await CacheHelper.saveData(key: 'Favorites', value: myFavorites);
      emit(ChangeFavoretisState());
    } else {
      myFavorites.add(productId);
      print('Add All $myFavorites');

      await CacheHelper.saveData(key: 'Favorites', value: myFavorites);
      emit(ChangeFavoretisState());
    }
  }

  // ? Branch Database

  Database? database;
  List<LocalCardUsersModel> cardUser = [];

  void createDatabase() {
    // open the database
    openDatabase('cards.db', version: 1, onCreate: (database, version) async {
      // When creating the db, create the table
      print('Database Created');
      await database
          .execute(
            'CREATE TABLE cards (id INTEGER PRIMARY KEY, productId INTEGER, title TEXT, desc TEXT, price TEXT,category TEXT, image TEXT, quantity INTEGER, dataTime TEXT)',
          )
          .then((value) => print('Table Created'))
          .catchError(
              (error) => print('Error when created table ${error.toString()}'));
    }, onOpen: (database) {
      getFromDatabase(database);
      print('Database Opened');
    }).then((value) {
      database = value;
      emit(CreateDatabaseState());
    });
  }

  insertDatabase({
    int? productId,
    String? title,
    String? desc,
    String? price,
    String? category,
    String? image,
    String? dataTime,
    int? quantity,
  }) async {
    await database?.transaction((txn) {
      txn
          .rawInsert(
        'INSERT INTO cards(productId, title, desc, price, category, image, quantity, dataTime) VALUES("$productId","$title","$desc","$price","$category","$image","$quantity","$dataTime")',
      )
          .then((value) {
        print('$value Insert Successfully');
        emit(InsertDatabaseState());
        getFromDatabase(database);
      }).catchError((error) {
        print('Error when inserting new record ${error.toString()}');
      });
      return Future.delayed(const Duration(microseconds: 100), () {
        print("Done");
      });
    });
  }

  Future<void> updateData({required int id, required int quantity}) async {
    database!.rawUpdate('UPDATE cards SET quantity = ? WHERE id = ?',
        [quantity, id]).then((value) {
      print('Update ' + value.toString());
      getFromDatabase(database);
      emit(UpdateDatabaseState());
    });
  }

  Future<void> deleteData({required int id, required int index}) async {
    database!.rawDelete('DELETE FROM cards WHERE id = ?', [id]).then((value) {
      updateQuantity.removeAt(index);
      getFromDatabase(database);
      emit(DeleteDatabaseState());
    });
  }

  void getFromDatabase(database) {
    cardUser = [];

    emit(GetDatabaseLoadingState());
    database.rawQuery('SELECT * FROM cards').then((value) {
      value.forEach((element) {
        cardUser.add(LocalCardUsersModel.fromJson(element));
        if (cardUser.isEmpty) {
          emit(IsClearCardeState());
        }
      });
      emit(GetDatabaseState());
    });
  }

  final List<int> updateQuantity = [];
  Color backgroundEditProduct = kSecondPrimaryColor;

  increaseQuantityData({required int index}) {
    updateQuantity[index]++;
    // backgroundEditProduct = kIconLoveColor;
    emit(IncreaseQuantityState());
  }

  decreaseQuantityData({required int index}) {
    updateQuantity[index]--;
    // backgroundEditProduct = kIconLoveColor;
    emit(DecreaseQuantityState());
  }

  bool showDone({required int index}) {
    if (cardUser[index].quantity > updateQuantity[index]) {
      return true;
    }
    if (cardUser[index].quantity < updateQuantity[index]) {
      return true;
    } else {
      return false;
    }
  }
}
