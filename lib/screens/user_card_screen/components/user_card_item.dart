// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:store_app/screens/products_screen/components/product_fallback_conditional.dart';

import '../../../app/constants.dart';
import '../../../app/cubit/app_cubit.dart';
import '../../../widget/list_view_animation.dart';

class UserCardItem extends StatelessWidget {
  const UserCardItem({Key? key, required this.cubit, required this.state})
      : super(key: key);

  final AppStates state;

  final AppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: cubit.listProduct != null,
      builder: (context) => ListView.separated(
        padding: const EdgeInsets.all(4),
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        itemCount: cubit.listCardUsersModel!.length,
        itemBuilder: (context, index) => ListViewAnimation(
          index: index,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Image.network(
                  cubit
                      .listProduct![cubit
                          .listCardUsersModel![index].product![index].productId]
                      .image,
                  width: 90,
                  height: 105,
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      cubit
                          .listProduct![cubit.listCardUsersModel![index]
                              .product![index].productId]
                          .title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: kWhiteColor),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      cubit
                          .listProduct![cubit.listCardUsersModel![index]
                              .product![index].productId]
                          .description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: kLightGrayColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        separatorBuilder: (context, index) =>
            const Divider(height: 30, thickness: 0.2, color: kWhiteColor),
      ),
      fallback: (context) =>
          ProductFallBackConditional(state: state, cubit: cubit),
    );
  }
}
