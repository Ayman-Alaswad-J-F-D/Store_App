// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/constants.dart';
import '../../app/cubit/app_cubit.dart';
import '../../widget/custom_app_bar.dart';
import '../../widget/custom_drawer.dart';
import '../../widget/grid_view_animation.dart';

import 'components/categories_item.dart';
import 'components/categories_fallback_conditional.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  static const String id = 'CategoriesScreen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        var cubit = AppCubit.get(context);

        return Scaffold(
          appBar: CustomAppBar(textTitle: 'Categories'),
          drawer: const CustomDrawer(),
          body: ConditionalBuilder(
            condition: cubit.listCategories?.isNotEmpty ?? false,
            builder: (context) => Stack(
              children: [
                Positioned(
                  top: 20,
                  left: MediaQuery.of(context).size.width / 7,
                  child: const Text(
                    'Categories Product',
                    style: TextStyle(
                      fontSize: 30,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: cubit.listCategories!.length,
                  itemBuilder: (context, index) => GridViewAnimation(
                    index: index,
                    child: CategoriesItem(item: cubit.listCategories![index]),
                  ),
                ),

                // Image.asset('assets/images/avatar2.webp'),
                // Positioned.fill(
                //   child: BackdropFilter(
                //     filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                //     child: const SizedBox(),
                //   ),
                // ),
              ],
            ),
            fallback: (context) =>
                CategoriesFallBackConditional(state: state, cubit: cubit),
          ),
        );
      },
    );
  }
}
