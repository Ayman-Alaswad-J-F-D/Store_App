import 'package:flutter/material.dart';

import '../../../app/constants.dart';
import '../../../app/cubit/app_cubit.dart';
import '../../../widget/custom_button.dart';
import '../../../widget/fade_route_animation.dart';
import '../../edit_screen/edit_screen.dart';

class UserCardBottomSheet extends StatelessWidget {
  const UserCardBottomSheet({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final AppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(color: Colors.black45, spreadRadius: 1, blurRadius: 4)
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        // vertical: cubit.listProduct != null ? 0 : 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: CustomButton(
              text: 'Order Products',
              backgroundColor: kSecondPrimaryColor,
              colorText: kWhiteColor,
              onTap: () {},
            )),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.06,
            ),
            if (cubit.cardUser.isNotEmpty)
              TextButton.icon(
                icon: const Icon(Icons.edit, color: kWhiteColor),
                label: const Text(
                  'Edit Products',
                  style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () => Navigator.push(
                  context,
                  FadeRouteAnimation(page: const EditScreen()),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
