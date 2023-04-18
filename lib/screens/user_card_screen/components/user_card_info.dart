import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:store_app/app/cubit/app_cubit.dart';

import '../../../app/constants.dart';
// import '../../../models/card_model.dart';

class UserCardInfo extends StatelessWidget {
  const UserCardInfo({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final cubit = AppCubit.get(context);
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Product',
                style: TextStyle(color: kYallowColor, fontSize: 16),
              ),
              Text(
                'Quantity',
                style: TextStyle(color: kYallowColor, fontSize: 16),
              ),
              Text(
                'Addition Time',
                style: TextStyle(color: kYallowColor, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cubit.cardUser[index].idProduct.toString(),
                style: const TextStyle(color: kWhiteColor, fontSize: 16),
              ),
              Text(
                cubit.cardUser[index].quantity.toString().padLeft(12, ' '),
                style: const TextStyle(color: kWhiteColor, fontSize: 16),
              ),
              Text(
                DateFormat.yMMMd()
                    .format(DateTime.parse(cubit.cardUser[index].dataTime))
                    .toString(),
                style: const TextStyle(color: kWhiteColor, fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
