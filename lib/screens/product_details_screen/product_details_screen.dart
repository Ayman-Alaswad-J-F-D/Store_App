import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/app/cubit/app_cubit.dart';
import 'package:store_app/widget/custom_app_bar.dart';

import '../../app/constants.dart';
import '../../models/product_model.dart';
import '../../widget/custom_bottom_sheet.dart';

import 'components/product_description.dart';
import 'components/product_details.dart';
import 'components/row_and_details_card.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key, required this.product})
      : super(key: key);

  static String id = 'DetailsProductPage';

  final ProductModel product;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    AppCubit.get(context).quantity = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // DetailsProductScreen productArguments =
    //     ModalRoute.of(context)!.settings.arguments as DetailsProductScreen;

    Size size = MediaQuery.of(context).size;

    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: kWhiteColor,
          appBar: CustomAppBar(textTitle: 'Details Product'),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.height,
                  child: Stack(
                    children: [
                      ProductDescription(product: widget.product),
                      ProductDetails(product: widget.product),
                      RowLikeAndDetailsCard(product: widget.product)
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomSheet: CustomBottomSheet(product: widget.product),
        );
      },
    );
  }
}


// Future<void> addProduct(ProductModel product) async {
//   await AddProduct.addProduct(
//     title: 'Ayman10',
//     price: product.price.toString(),
//     description: product.description,
//     image: product.image,
//     categories: product.category,
//   );
// }
