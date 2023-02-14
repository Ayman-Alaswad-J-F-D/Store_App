import 'package:flutter/material.dart';

import '../../../app/constants.dart';
import '../../../models/product_model.dart';
import '../../../widget/custom_rating.dart';

import 'like_product.dart';

class RowLikeAndDetailsCard extends StatelessWidget {
  const RowLikeAndDetailsCard({Key? key, required this.product})
      : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 80,
        ),
        child: Row(
          children: [
            LikeProduct(
              id: product.id,
              shadowTrue: true,
              height: 40,
              sizeIcon: 18,
            ),
            const SizedBox(width: 25),
            CustomRating(
              rate: product.rating!.rate.toString(),
              colorValueLable: kSecondPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
