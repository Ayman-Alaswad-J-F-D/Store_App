import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../app/constants.dart';
import '../app/cubit/app_cubit.dart';
import '../models/product_model.dart';
import 'custom_button.dart';
import 'custom_circular_progress.dart';
import 'custom_snack_bar.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({Key? key, required this.product}) : super(key: key);

  final ProductModel product;

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  // int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final appCubit = AppCubit.get(context);

    return Container(
      color: kPrimaryColor,
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          color: kSecondPrimaryColor,
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(FontAwesomeIcons.minus),
              color: kWhiteColor,
              onPressed: () {
                if (appCubit.quantity > 1) {
                  setState(() => appCubit.quantity--);
                }
              },
            ),
            Text(
              appCubit.quantity.toString().padLeft(2, '0'),
              style: const TextStyle(color: kWhiteColor, fontSize: 18),
            ),
            IconButton(
              icon: const Icon(FontAwesomeIcons.plus),
              color: kWhiteColor,
              onPressed: () {
                if (appCubit.quantity < widget.product.rating!.count) {
                  setState(() => appCubit.quantity++);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    CustomSnakBar(
                      text:
                          'Max Quantity This Product is ${widget.product.rating!.count}',
                    ),
                  );
                }
              },
            ),
            Expanded(
              child: CustomButton(
                text: 'Add To Card',
                backgroundColor: kWhiteColor,
                colorText: kPrimaryColor,
                onTap: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (builder) {
                      return const CustomCircularProgress();
                    },
                  );
                  Future.delayed(const Duration(milliseconds: 600), () {
                    appCubit.insertDatabase(
                      productId: widget.product.id,
                      title: widget.product.title,
                      desc: widget.product.description,
                      image: widget.product.image,
                      price: widget.product.price.toString(),
                      category: widget.product.category,
                      quantity: appCubit.quantity,
                      dataTime: DateTime.now().toString(),
                    );
                  }).then(
                    (_) {
                      Navigator.pop(context);
                      return ScaffoldMessenger.of(context).showSnackBar(
                        CustomSnakBar(
                          text:
                              'Done Adding ${appCubit.quantity} form this product',
                        ),
                      );
                    },
                  ).catchError((onError) {
                    // SchedulerBinding.instance!.addPostFrameCallback(
                    //   (_) => Navigator.pop(context),
                    // );
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      CustomSnakBar(text: '$onError'),
                    );
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
