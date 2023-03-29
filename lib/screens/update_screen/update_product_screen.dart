// ignore_for_file: import_of_legacy_library_into_null_safe, avoid_print

import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:store_app/app/constants.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product_service.dart';

import '../../widget/custom_app_bar.dart';
import '../../widget/custom_button.dart';
import '../../widget/cutom_text_field.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({Key? key}) : super(key: key);

  static String id = 'UpdateProductPage';

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? productName, price, description, image;
  // double? price;
  bool isLoading = false;

  final nameProductController = TextEditingController();
  final priceProductController = TextEditingController();
  final descProductController = TextEditingController();
  final imageProductController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      opacity: 0.1,
      progressIndicator: const CircularProgressIndicator(
        color: Colors.deepPurple,
      ),
      child: Scaffold(
        appBar: CustomAppBar(textTitle: 'Update Product'),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),
                CustomTextFormField(
                  textEditingController: nameProductController,
                  typeInput: TextInputType.name,
                  label: 'Name Product',
                  colorLableText: kPrimaryColor,
                  filledNeed: true,
                  fillColor: kLightPrimaryColor,
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  textEditingController: priceProductController,
                  typeInput: TextInputType.name,
                  label: 'Price',
                  colorLableText: kPrimaryColor,
                  filledNeed: true,
                  fillColor: kLightPrimaryColor,
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  textEditingController: descProductController,
                  typeInput: TextInputType.name,
                  label: 'Description',
                  colorLableText: kPrimaryColor,
                  filledNeed: true,
                  fillColor: kLightPrimaryColor,
                ),
                const SizedBox(height: 25),
                CustomButton(
                  text: 'Update',
                  backgroundColor: kSecondPrimaryColor,
                  colorText: kWhiteColor,
                  onTap: () async {
                    setState(() {
                      isLoading = true;
                    });
                    try {
                      await updateProduct(product);
                      print('success');
                    } catch (e) {
                      print('error' '$e');
                      ScaffoldMessenger.of(context).showSnackBar(
                        CustomSnackBar('$e' ', Plese Try Again'),
                      );
                    }
                    setState(() {
                      isLoading = false;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService.updateProduct(
      id: product.id,
      title: productName ?? product.title,
      price: price ?? product.price.toString(),
      description: description ?? product.description,
      image: image ?? product.image,
      categories: product.category,
      // rate: product.rating.rate,
      // count: product.rating.count,
    );
  }
}

// ignore: non_constant_identifier_names
SnackBar CustomSnackBar(text) => SnackBar(
      padding: const EdgeInsets.all(20),
      content: Text(text),
      duration: const Duration(seconds: 4),
    );
