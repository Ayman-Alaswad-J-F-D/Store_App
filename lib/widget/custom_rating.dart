import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

import '../theme/colors.dart';

class CustomRating extends StatelessWidget {
  const CustomRating({
    Key? key,
    required this.rate,
    this.colorValueLable,
  }) : super(key: key);

  final num rate;
  final Color? colorValueLable;

  @override
  Widget build(BuildContext context) {
    return RatingStars(
      value: double.parse(rate.toString()),
      maxValueVisibility: false,
      starColor: Colors.amber,
      starSpacing: 0.5,
      valueLabelPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
      valueLabelRadius: 5,
      // onValueChanged: (v) {
      //   setState(() {
      //     widget.rate = v;
      //   });
      // },
      starCount: 5,
      starBuilder: (index, color) => Icon(
        Icons.star_sharp,
        color: color,
        size: 18,
      ),
      valueLabelColor: colorValueLable ?? AppColors.primaryColor,
    );
  }
}
