import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/app/cubit/app_cubit.dart';
// import 'package:store_app/models/product_model.dart';

import '../../../app/constants.dart';

// ignore: must_be_immutable
class LikeProduct extends StatefulWidget {
  int id;
  bool shadowTrue;
  double height;
  double sizeIcon;

  LikeProduct({
    Key? key,
    required this.id,
    required this.shadowTrue,
    required this.height,
    required this.sizeIcon,
  }) : super(key: key);

  @override
  State<LikeProduct> createState() => _LikeProductState();
}

class _LikeProductState extends State<LikeProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        boxShadow: widget.shadowTrue
            ? const [
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 3,
                )
              ]
            : null,
        shape: BoxShape.circle,
        border: Border.all(width: 2, color: kSecondPrimaryColor),
        color: kWhiteColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Icon(
          AppCubit.get(context).myFavorites.contains(widget.id)
              ? FontAwesomeIcons.solidHeart
              : FontAwesomeIcons.heart,
          semanticLabel: 'Like',
          size: widget.sizeIcon,
          color: kIconLoveColor,
        ),
      ),
    );
  }
}
