import 'package:flutter/material.dart';

import '../app/constants.dart';

class CustomCircularProgress extends StatelessWidget {
  const CustomCircularProgress({
    Key? key,
    this.elevation = 0.0,
    this.radius = 0.0,
  }) : super(key: key);

  final double elevation;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        color: kWhiteColor,
        elevation: elevation,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: kWhiteColor,
            child: CircularProgressIndicator(
              color: kLightPrimaryColor,
              backgroundColor: kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}


// Card(
//         child: Padding(
//           padding: EdgeInsets.all(8),
//           child: CircularProgressIndicator(
//             backgroundColor: kLightPrimaryColor,
//             color: kPrimaryColor,
//           ),
//         ),
//       )