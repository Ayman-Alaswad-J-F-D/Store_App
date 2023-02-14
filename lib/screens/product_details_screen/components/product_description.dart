import 'package:flutter/material.dart';
import 'package:store_app/screens/product_details_screen/components/read_more_text.dart';

import '../../../app/constants.dart';
import '../../../models/product_model.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({Key? key, required this.product}) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      margin: EdgeInsets.only(top: size.height * 0.41),
      padding: EdgeInsets.only(
        top: size.height * 0.08,
        left: 20,
        right: 20,
        bottom: 20,
      ),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Description',
              style: TextStyle(
                color: kWhiteColor,
                fontSize: 16.5,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 10),
            ReadMoreText(text: product.description, sizeHeight: size.height),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
