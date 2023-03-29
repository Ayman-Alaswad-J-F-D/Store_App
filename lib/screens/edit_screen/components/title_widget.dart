import 'package:flutter/material.dart';

import '../../../app/constants.dart';
import '../../../app/cubit/app_cubit.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
    required this.index,
    required this.cubit,
  }) : super(key: key);

  final AppCubit cubit;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Quantity',
            style: TextStyle(color: kPrimaryColor, fontSize: 18),
          ),
          Text(
            cubit.updateQuantity[index].toString().padLeft(2, '0'),
            // cubit.cardUser[index].quantity.toString().padLeft(2, '0'),
            style: const TextStyle(color: kPrimaryColor, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
