import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../app/constants.dart';
import '../app/cubit/app_cubit.dart';
import '../models/product_model.dart';
import 'custom_button.dart';
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
          color: kSecondPrimaryColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            IconButton(
              color: kWhiteColor,
              onPressed: () {
                if (appCubit.quantity > 1) {
                  setState(() => appCubit.quantity--);
                }
              },
              icon: const Icon(FontAwesomeIcons.minus),
            ),
            Text(
              appCubit.quantity.toString().padLeft(2, '0'),
              style: const TextStyle(color: kWhiteColor, fontSize: 18),
            ),
            IconButton(
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
              icon: const Icon(FontAwesomeIcons.plus),
            ),
            Expanded(
              child: CustomButton(
                onTap: () {
                  appCubit.addToCard(widget.product, context).then(
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
                text: 'Add To Card',
                backgroundColor: kWhiteColor,
                colorText: kPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
