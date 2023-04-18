import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:store_app/app/constants.dart';
import 'package:store_app/app/cubit/app_cubit.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widget/custom_rating.dart';

import '../../../widget/fade_route_animation.dart';
import '../../product_details_screen/product_details_screen.dart';
import 'custom_image_network.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({
    required this.product,
    Key? key,
  }) : super(key: key);

  final ProductModel product;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
// with TickerProviderStateMixin {
  // late AnimationController scaleController;
  // late Animation<double> scaleAnimation;
  // bool isLove = false;
  double valueStars = 0;

  @override
  void initState() {
    super.initState();
    // scaleController = AnimationController(
    //   vsync: this,
    //   duration: const Duration(milliseconds: 200),
    // )..addStatusListener((status) {
    //     if (status == AnimationStatus.completed) {
    //       // Navigator.pushNamed(
    //       //   context,
    //       // AnimatingRoute(
    //       //   route:
    //       //       DetailsProductScreen(isLove: isLove, product: widget.product),
    //       // ),
    //       Navigator.pushNamed(
    //         context,
    //         DetailsProductScreen.id,
    //         arguments:
    //             DetailsProductScreen(isLove: isLove, product: widget.product),
    //         // );
    //       );
    //       Timer(const Duration(milliseconds: 200), () {
    //         scaleController.reset();
    //       });
    //     }
    //   });
    // scaleAnimation =
    //     Tween<double>(begin: 0.0, end: 20.0).animate(scaleController);
  }

  @override
  void dispose() {
    // scaleController.dispose();

    super.dispose();
  }

  @override
  Widget build(context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          FadeRouteAnimation(
            page: ProductDetailsScreen(product: widget.product),
          ),
        );
        // scaleController.forward();
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  spreadRadius: -10,
                  color: Colors.grey.shade200,
                  offset: const Offset(4, 10),
                ),
              ],
            ),
            child: Card(
              elevation: 2,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: kLightGrayColor),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$ ${widget.product.price}',
                            style: const TextStyle(
                              fontSize: 15,
                              color: kPrimaryTextColor,
                            ),
                          ),
                          InkWell(
                            onTap: () async => await AppCubit.get(context)
                                .changeFavoritess(widget.product.id),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 4,
                              ),
                              child: Icon(
                                AppCubit.get(context)
                                        .myFavorites
                                        .contains(widget.product.id)
                                    ? FontAwesomeIcons.solidHeart
                                    : FontAwesomeIcons.heart,
                                color: Colors.red,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomRating(rate: widget.product.rating!.rate.toString()),
                  ],
                ),
              ),
            ),
          ),
          CustomImageNetwork(widget: widget),
          Container(
            width: 16,
            height: 16,
            child: Center(
              child: Text(
                widget.product.id.toString(),
                style: const TextStyle(color: kWhiteColor, fontSize: 10),
              ),
            ),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: kSecondPrimaryColor,
            ),
          ),

          // Container(
          //   color: Colors.transparent,
          //   width: 200,
          //   height: 200,
          //   child: AnimatedBuilder(
          //     animation: scaleAnimation,
          //     builder: (c, child) => Transform.scale(
          //       scale: scaleAnimation.value,
          //       child: Container(
          //         decoration: const BoxDecoration(
          //           shape: BoxShape.circle,
          //           color: kWhiteColor,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
