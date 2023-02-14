import 'package:flutter/material.dart';

import '../../../app/constants.dart';
import '../../../widget/fade_route_animation.dart';
import '../../categories_details_screen/categoreis_details_screen.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final String item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80, left: 15, right: 15),
      child: Container(
        height: 50,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: const BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 2),
          ],
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              FadeRouteAnimation(
                page: CategoriesDetailsScreen(categoriesTitle: item),
              ),
            );
          },
          child: Center(
            child: Text(
              item,
              style: const TextStyle(
                fontSize: 17,
                color: kWhiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
