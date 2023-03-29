// ignore_for_file: import_of_legacy_library_into_null_safe, deprecated_member_use

// import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
// import 'package:store_app/screens/products_screen/components/product_fallback_conditional.dart';

import '../../../app/constants.dart';
import '../../../app/cubit/app_cubit.dart';
// import '../../../widget/list_view_animation.dart';

class UserCardItem extends StatelessWidget {
  const UserCardItem({
    Key? key,
    // required this.cubit,
    // required this.state,
    required this.index,
  }) : super(key: key);

  // final AppStates state;
  // final AppCubit cubit;
  final int index;

  @override
  Widget build(BuildContext context) {
    final cubit = AppCubit.get(context);
    return

        // Dismissible(
        // key: Key(cubit.cardUser[index].id.toString()),
        // background: Container(
        //   color: Colors.red,
        //   child: Padding(
        //     padding: const EdgeInsets.all(15),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       children: const [
        //         Icon(Icons.delete, color: Colors.white),
        //         Text('Move to trash', style: TextStyle(color: Colors.white)),
        //       ],
        //     ),
        //   ),
        // ),
        // secondaryBackground: Container(
        //   color: Colors.red,
        //   child: Padding(
        //     padding: const EdgeInsets.all(15),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.end,
        //       children: const [
        //         Icon(Icons.delete, color: Colors.white),
        //         Text('Move to trash', style: TextStyle(color: Colors.white)),
        //       ],
        //     ),
        //   ),
        // ),
        // confirmDismiss: (DismissDirection direction) async {
        //   return await showDialog(
        //     context: context,
        //     builder: (context) {
        //       return AlertDialog(
        //         title: const Text(
        //           "Delete Confirmation",
        //           style: TextStyle(color: Colors.red),
        //         ),
        //         content: Text(
        //           "Are you sure you want to delete this product ?",
        //           style: TextStyle(color: Colors.grey.shade600),
        //         ),
        //         actions: [
        //           FlatButton(
        //             onPressed: () => Navigator.of(context).pop(false),
        //             child: const Text("Cancel"),
        //           ),
        //           FlatButton(
        //             onPressed: () => Navigator.of(context).pop(true),
        //             child: const Text(
        //               "Delete",
        //               style: TextStyle(color: Colors.red),
        //             ),
        //           ),
        //         ],
        //       );
        //     },
        //   );
        // },
        // onDismissed: (direction) {
        //   cubit.deleteData(id: cubit.cardUser[index].id);
        // },
        // child: ,
        // ),

        Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: cubit.cardUser[index].image.isEmpty
              ? Image.network(
                  // cubit
                  //     .listProduct![cubit
                  //         .listCardUsersModel![index].product![index].productId]
                  //     .image,
                  cubit.cardUser[index].image,
                  width: 90,
                  height: 105,
                )
              : const Icon(
                  Icons.image_not_supported_rounded,
                  color: kPrimaryColor,
                  size: 100,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                // cubit
                //     .listProduct![cubit.listCardUsersModel![index]
                //         .product![index].productId]
                //     .title,
                cubit.cardUser[index].title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: kWhiteColor),
              ),
              const SizedBox(height: 15),
              Text(
                // cubit
                //     .listProduct![cubit.listCardUsersModel![index]
                //         .product![index].productId]
                //     .description,
                cubit.cardUser[index].category,

                style: const TextStyle(color: kSecondPrimaryColor),
              ),
              const SizedBox(height: 15),
              Text(
                // cubit
                //     .listProduct![cubit.listCardUsersModel![index]
                //         .product![index].productId]
                //     .description,
                '\$ ${cubit.cardUser[index].price}',

                style: const TextStyle(color: kYallowColor),
              ),
            ],
          ),
        ),
      ],
    );

    //  ListView.separated(
    //   padding: const EdgeInsets.all(4),
    //   physics: const BouncingScrollPhysics(
    //     parent: AlwaysScrollableScrollPhysics(),
    //   ),
    //   itemCount: cubit.cardUser?.length ?? 0,
    //   separatorBuilder: (context, index) =>
    //       const Divider(height: 27, thickness: 0.2, color: kWhiteColor),
    //   itemBuilder: (context, index) => ListViewAnimation(
    //     index: index,
    //     child:   ),
    // );

    //  ConditionalBuilder(
    // condition: cubit.cardUser != null,
    // builder: (context) => fallback: (context) =>
    //     ProductFallBackConditional(state: state, cubit: cubit),
    // );
  }
}
