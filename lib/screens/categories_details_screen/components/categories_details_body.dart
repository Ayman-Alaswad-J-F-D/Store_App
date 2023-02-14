import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../app/constants.dart';
import '../../../models/catefories_model.dart';
import '../../../widget/list_view_animation.dart';

class CategoriesDetailsBody extends StatelessWidget {
  const CategoriesDetailsBody({
    Key? key,
    required this.categoriesModel,
  }) : super(key: key);

  final List<CategoriesModel> categoriesModel;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          padding: const EdgeInsets.symmetric(vertical: 20),
          itemBuilder: (context, index) => ListViewAnimation(
            index: index,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.115,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kWhiteColor,
                boxShadow: const [
                  BoxShadow(blurRadius: 5, color: Colors.black45)
                ],
              ),
              child: Center(
                child: ListTile(
                  leading: Image.network(
                    categoriesModel[index].image,
                    width: MediaQuery.of(context).size.width * 0.25,
                    errorBuilder: (context, error, stackTrace) => const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: CircularProgressIndicator(color: kPrimaryColor),
                    ),
                  ),
                  title: Text(
                    categoriesModel[index].title,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: kPrimaryColor),
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      categoriesModel[index].price.toString() + '\$',
                      style: const TextStyle(color: kPrimaryTextColor),
                    ),
                  ),
                ),
              ),
            ),
          ),
          separatorBuilder: (context, index) => const Divider(height: 35),
          itemCount: categoriesModel.length,
        ),
      ),
    );
  }
}
