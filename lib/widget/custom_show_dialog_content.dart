import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../app/constants.dart';
import '../app/cubit/app_cubit.dart';

// import '../screens/home_screen/cubit/home_cubit.dart';

class CustomShowDialogContent extends StatelessWidget {
  const CustomShowDialogContent({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    // final index AppCubit.get(context).cardUser[index].dataTime index;

    return Card(
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height / 3,
        horizontal: MediaQuery.of(context).size.width / 10,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Your Card",
                  style: TextStyle(fontSize: 20, color: kSecondPrimaryColor),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(
                    FontAwesomeIcons.cartArrowDown,
                    color: kSecondPrimaryColor,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: kLightPrimaryColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "Quantity in your card :  ",
                        style: TextStyle(fontSize: 18, color: kPrimaryColor),
                      ),
                      Text(
                        AppCubit.get(context)
                            .cardUser[index]
                            .quantity
                            .toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          color: kPrimaryTextColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      const Text(
                        "Time Adding :  ",
                        style: TextStyle(fontSize: 18, color: kPrimaryColor),
                      ),
                      Text(
                        DateFormat.yMMMd()
                            .format(
                              DateTime.parse(
                                AppCubit.get(context).cardUser[index].dataTime,
                              ),
                            )
                            .toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          color: kPrimaryTextColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
