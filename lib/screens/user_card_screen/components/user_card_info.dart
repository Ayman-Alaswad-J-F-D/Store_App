import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../app/constants.dart';
import '../../../models/card_model.dart';

class UserCardInfo extends StatelessWidget {
  const UserCardInfo({
    Key? key,
    required this.index,
    required this.cardUsersModel,
  }) : super(key: key);

  final int index;
  final CardModel cardUsersModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: kPrimaryColor,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Product',
                style: TextStyle(color: kYallowColor, fontSize: 18),
              ),
              Text(
                "Quantity",
                style: TextStyle(color: kYallowColor, fontSize: 18),
              ),
              Text(
                'Data Time',
                style: TextStyle(color: kYallowColor, fontSize: 18),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cardUsersModel.product?[index].productId.toString() ?? '0',
                style: const TextStyle(color: kWhiteColor, fontSize: 16),
              ),
              Text(
                cardUsersModel.product?[index].quantity
                        .toString()
                        .padLeft(15, ' ') ??
                    '0',
                style: const TextStyle(color: kWhiteColor, fontSize: 16),
              ),
              Text(
                DateFormat.yMMMd()
                    .format(DateTime.parse(cardUsersModel.data))
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
