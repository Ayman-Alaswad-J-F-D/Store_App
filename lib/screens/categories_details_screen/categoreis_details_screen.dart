// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/constants.dart';
import '../../app/cubit/app_cubit.dart';
import '../../widget/custom_app_bar.dart';

import 'components/categories_details_body.dart';
import 'components/categories_details_fallback_conditional.dart';

class CategoriesDetailsScreen extends StatefulWidget {
  const CategoriesDetailsScreen({
    Key? key,
    required this.categoriesTitle,
  }) : super(key: key);

  final String categoriesTitle;

  @override
  State<CategoriesDetailsScreen> createState() =>
      _CategoriesDetailsScreenState();
}

class _CategoriesDetailsScreenState extends State<CategoriesDetailsScreen> {
  @override
  void initState() {
    AppCubit.get(context)
        .getCategoriesDetails(categoryName: widget.categoriesTitle);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = AppCubit.get(context);

    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: kPrimaryColor,
          appBar: CustomAppBar(textTitle: 'Categories Details'),
          body: ConditionalBuilder(
            condition: cubit.listCategoriesDetails != null &&
                state is CategoriesDetailsSuccessState,
            builder: (context) => CategoriesDetailsBody(
              categoriesModel: cubit.listCategoriesDetails!,
            ),
            fallback: (context) {
              return CategoriesDetailsFallBackConditional(
                cubit: cubit,
                state: state,
                categoriesTitle: widget.categoriesTitle,
              );
            },
          ),
        );
      },
    );
  }
}
