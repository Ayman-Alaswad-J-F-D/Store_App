import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../models/product_model.dart';
import '../../../widget/grid_view_animation.dart';
import 'custom_card.dart';

class ProductBody extends StatelessWidget {
  const ProductBody({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<ProductModel> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 90,
        bottom: 20,
      ),
      child: AnimationLimiter(
        child: GridView.builder(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          clipBehavior: Clip.none,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4,
            mainAxisSpacing: 95,
          ),
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return GridViewAnimation(
              index: index,
              child: CustomCard(product: data[index]),
            );
          },
        ),
      ),
    );
  }
}
