import 'package:flutter/material.dart';

import '../theme/colors.dart';

class CustomCircularProgress extends StatelessWidget {
  const CustomCircularProgress({
    Key? key,
    this.elevation = 0.0,
  }) : super(key: key);

  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: const CircleBorder(),
        color: AppColors.whiteColor,
        surfaceTintColor: AppColors.primaryColor,
        elevation: elevation,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: AppColors.whiteColor,
            child: CircularProgressIndicator(
              color: AppColors.lightPrimaryColor,
              backgroundColor: AppColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
