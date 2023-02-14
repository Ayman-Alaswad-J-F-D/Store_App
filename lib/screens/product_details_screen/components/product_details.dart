import 'package:flutter/material.dart';

import '../../../app/constants.dart';
import '../../../models/product_model.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'New Product',
            style: TextStyle(color: kGrayColor, fontSize: 15),
          ),
          const SizedBox(height: 5),
          Text(
            product.title,
            style: const TextStyle(
              color: kPrimaryTextColor,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(color: kGrayColor, fontSize: 15),
                      children: [
                        const TextSpan(text: "Price\n"),
                        TextSpan(
                          text: "\$ ${product.price.toString()}",
                          style: const TextStyle(
                            color: kPrimaryTextColor,
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 50),
                  Expanded(
                    child: Hero(
                      tag: product.id,
                      child: Image.network(
                        product.image,
                        height: 200,
                        width: 100,
                        errorBuilder: (context, object, stackTrack) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 100),
                            child: SizedBox(),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              RichText(
                text: TextSpan(
                  style: const TextStyle(color: kGrayColor, fontSize: 15),
                  children: [
                    const TextSpan(text: "Quantity\n"),
                    TextSpan(
                      text: product.rating!.count.toString(),
                      style: const TextStyle(
                        color: kPrimaryTextColor,
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
