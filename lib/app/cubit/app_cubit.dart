import 'dart:async';
import 'dart:developer' as dev;
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../services/all_product_service.dart';
import '../../database/class_create_database.dart';
import '../../database/class_delete_database.dart';
import '../../database/class_insert_database.dart';
import '../../database/class_read_database.dart';
import '../../database/class_update_database.dart';
import '../../helper/local/cache_helper.dart';
import '../../models/card_user_model.dart';
import '../../models/product_model.dart';
import '../extensions.dart';
import '../functions/toast_snack_bar.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppStates>
    with
        ExecuteCreateDB,
        ExecuteReadDB,
        ExecuteInsertDB,
        ExecuteUpdateDB,
        ExecuteDeleteDB {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of<AppCubit>(context);

  final List<ProductModel> products = [];
  final List<dynamic> cachedFavorite =
      CacheHelper.getData(key: "Favorites") ?? [];

  //* Executed when scrolling down in the product screen
  void refreshProductData() {
    products.clear();
    getProductsData();
  }

  //* Fetch all product data and then extraction first images and categories
  void getProductsData() async {
    if (products.isNotEmpty) return;
    emit(ProductsLoadingState());
    await hasConnection();
    await AllProductService.getAllProduct().then((value) {
      //* Fill list products
      products.addAll(value);
      dev.log(products[0].toString());
    }).then((_) {
      _extractionFirstImagesAndCategories();
      emit(ProductsSuccessState());
    }).catchError((error) {
      dev.log(error.toString());
      emit(ProductsErrorState());
    });
  }

  Future<void> hasConnection() async {
    if (!await checkConnection()) {
      Future.delayed(
        const Duration(seconds: 2),
        () => emit(CheckConnectionState()),
      );
    }
  }

  Future<bool> checkConnection() async =>
      await InternetConnectionChecker().hasConnection;

  //* Add or delete product to favorite list and cached that in cache memory
  void changeFavorites(int productId) async {
    if (cachedFavorite.contains(productId)) {
      cachedFavorite.remove(productId);
      emit(ChangeFavoriteState());
      await CacheHelper.saveData(key: "Favorites", value: cachedFavorite);
    } else {
      cachedFavorite.add(productId);
      emit(ChangeFavoriteState());
      await CacheHelper.saveData(key: "Favorites", value: cachedFavorite);
    }
  }

  //* Get the first images and first categories for products list
  final List<Map<String, String>> firstImagesAndCategories = [];
  final List<String> categoriesImages = [];
  final List<String> categories = [];

  void _extractionFirstImagesAndCategories() {
    if (firstImagesAndCategories.isNotEmpty) return;
    final Map<String, String> imageAndCategory = {};
    _fillImagesAndCategoriesFromListProduct(imageAndCategory);
    _fillFirstImagesAndCategories(imageAndCategory);
    _fillFirstCategories();
    _fillFirstImages();
  }

  void _fillImagesAndCategoriesFromListProduct(
    Map<String, String> imageAndCategory,
  ) {
    for (ProductModel product in products) {
      if (!imageAndCategory.containsKey(product.category)) {
        imageAndCategory[product.category] = product.image;
      }
    }
  }

  void _fillFirstImagesAndCategories(Map<String, String> imageAndCategory) {
    firstImagesAndCategories.addAll(
      imageAndCategory.entries
          .map((e) => {"category": e.key, "image": e.value})
          .toList(),
    );
  }

  void _fillFirstCategories() {
    categories.addAll(
      firstImagesAndCategories
          .map((category) => category["category"]!)
          .toList(),
    );
  }

  void _fillFirstImages() {
    categoriesImages.addAll(
      firstImagesAndCategories.map((image) => image["image"]!).toList(),
    );
  }

  ///?________________________________________ Database Branch for ( User Card ) ________________________________________///

  final List<LocalUserCardModel> cardUser = <LocalUserCardModel>[];
  final List<int> quantityHelper = <int>[];
  int quantity = 1;

  //* Initialize the database when the application is launched for the first time
  void initLocalDB() => executeCreateLocalDatabase();

  //* Execute insert function into database
  void addToCard({required ProductModel product}) async {
    await executeInsertIntoDatabase(product: product, quantity: quantity)
        .then((_) => _getProductsFromDB())
        .then((_) => emit(InsertDatabaseState()));
  }

  //* Update product qunatity from user card
  void updateProductQuantityFromUserCard({required int index}) async =>
      await executeUpdateInDatabase(
        id: cardUser[index].id,
        quantity: quantityHelper[index],
      )
          .then((_) => _getProductsFromDB())
          .then((_) => emit(UpdateDatabaseState()));

  //* Delete product from user card
  void deleteProductFromUserCard({required int index}) {
    quantityHelper.removeAt(index);
    executeDelete(id: cardUser[index].id)
        .then((_) => _getProductsFromDB())
        .then((_) => emit(DeleteDatabaseState()));
  }

  //* Get products for user card
  void _getProductsFromDB() async {
    cardUser.clear();
    await executeReadeDataFromDatabase()
        .then((products) => _fillCardUser(products))
        .then((_) => _calculatePriceAndQuantity());
  }

  //* Fill card list from database
  void _fillCardUser(List<Map<String, Object?>> products) {
    cardUser.addAll(
      products.map((product) => LocalUserCardModel.fromMap(product)).toList(),
    );
  }

  //* Calculation price and quantity after update card list item
  void _calculatePriceAndQuantity() {
    _fillQuantityHelper();
    _getTotalPriceForProduct();
    _getTotalPriceForAllProducts();
  }

  //* Fill quantity helper from card list
  void _fillQuantityHelper() {
    quantityHelper.clear();
    quantityHelper.addAll(cardUser.map((product) => product.quantity).toList());
    log("Quantity Helper: $quantityHelper");
  }

  //* Calculation total price for SINGLE product after update the quantity of the card list item
  List<double> totalPriceForProduct = [];
  void _getTotalPriceForProduct() {
    try {
      if (cardUser.isNotEmpty) {
        totalPriceForProduct = _calculationTotalPrice();
      }
    } catch (error) {
      log(error.toString(), name: "Get Total Price For Product");
    }
    log("Total Price For Product: $totalPriceForProduct");
  }

  //* Calculation the total price of [All] products after updating the quantity of the card list item
  double totalPrice = 0.0;
  void _getTotalPriceForAllProducts() {
    try {
      if (cardUser.isNotEmpty) _calculationTotalPriceForAllProduct();
    } catch (error) {
      log(error.toString(), name: "Get Total Price For All Products");
    }
    log("Total Price For All: $totalPrice");
  }

  //* Collection of product prices
  void _calculationTotalPriceForAllProduct() {
    // To round to just two decimal places,
    // we multiply by 100 and then round and then divide by 100
    totalPrice = _calculationTotalPrice()
        .reduce((prevPrice, currPrice) => prevPrice + currPrice)
        .roundingToTwoDecimal();
  }

  //* Calculation the total price for products
  List<double> _calculationTotalPrice() {
    return cardUser
        .map(
          (product) => (product.price * product.quantity)
              .toDouble()
              .roundingToTwoDecimal(),
        )
        .toList();
  }

  //* Increase quantity in card list (edit_product_screen)
  void increaseQuantityItem({
    required int index,
    required BuildContext context,
  }) {
    if (quantityHelper[index] <= products[index].rating!.count) {
      quantityHelper[index]++;
    } else {
      toastSnackBar(
        context: context,
        text: "Max Quantity This Product is ${products[index].rating!.count}",
      );
    }
  }

  //* Decrease quantity in card list (edit_product_screen)
  void decreaseQuantityItem({required int index}) {
    if (quantityHelper[index] > 1) quantityHelper[index]--;
  }

  //* Increase quantity in (product_details_screen)
  void increaseQuantityProduct({
    required ProductModel product,
    required BuildContext context,
  }) {
    if (quantity <= product.rating!.count) {
      quantity++;
    } else {
      toastSnackBar(
        context: context,
        text: "Max Quantity This Product is ${product.rating!.count}",
      );
    }
  }

  //* Decrease quantity in (product_details_screen)
  void decreaseQuantityProduct() => {if (quantity > 1) quantity--};

  //* Check if product in card list
  bool isInCard({required int idProduct}) =>
      cardUser.any((product) => product.idProduct == idProduct);

  //* Show edit confirm when Increase or Decrease on item card list quantity
  bool shouldShowUpdateConfirm({required int index}) =>
      cardUser[index].quantity != quantityHelper[index];

  //* Function for Pick image from device
  File pictureFromGallery = File("");
  Future pickImage({ImageSource imageSource = ImageSource.gallery}) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image == null) return;
      pictureFromGallery = File(image.path);
      dev.log(pictureFromGallery.toString());
      emit(ImagePickerState());
      //* Post Imge to API
    } on PlatformException catch (e) {
      dev.log("Failed to pick image: $e");
    }
  }
}
