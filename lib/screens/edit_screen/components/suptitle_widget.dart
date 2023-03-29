import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../app/constants.dart';
import '../../../app/cubit/app_cubit.dart';
import '../../../widget/custom_snack_bar.dart';

class SuptitleWidget extends StatelessWidget {
  const SuptitleWidget({
    Key? key,
    required this.cubit,
    required this.index,
  }) : super(key: key);

  final AppCubit cubit;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 13,
            backgroundColor: kPrimaryColor,
            child: IconButton(
              iconSize: 13,
              color: kWhiteColor,
              padding: EdgeInsets.zero,
              icon: const Icon(FontAwesomeIcons.minus),
              onPressed: () {
                if (cubit.updateQuantity[index] > 1) {
                  cubit.decreaseQuantityData(index: index);

                  // cubit.updateData(
                  //   id: cubit.cardUser[index].id,
                  //   quantity: cubit.cardUser[index].quantity - 1,
                  // );
                }
              },
            ),
          ),
          CircleAvatar(
            radius: 13,
            backgroundColor: kPrimaryColor,
            child: IconButton(
              iconSize: 13,
              color: kWhiteColor,
              padding: EdgeInsets.zero,
              icon: const Icon(FontAwesomeIcons.plus),
              onPressed: () {
                if (cubit.cardUser[index].quantity <
                    cubit.listProduct?[index].rating!.count) {
                  cubit.increaseQuantityData(index: index);

                  // cubit.updateData(
                  //   id: cubit.cardUser[index].id,
                  //   quantity: cubit.cardUser[index].quantity + 1,
                  // );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    CustomSnakBar(
                      text:
                          'Max Quantity This Product is ${cubit.listProduct![index].rating!.count}',
                      backgroundColor: kSecondPrimaryColor,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
