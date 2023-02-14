import 'package:flutter/material.dart';

import '../../../app/cubit/app_cubit.dart';
import '../../../widget/custom_circular_progress.dart';
import '../../../widget/fall_back_connection_widget.dart';

class CategoriesDetailsFallBackConditional extends StatelessWidget {
  const CategoriesDetailsFallBackConditional({
    Key? key,
    required this.cubit,
    required this.state,
    required this.categoriesTitle,
  }) : super(key: key);

  final AppCubit cubit;
  final AppStates state;
  final String categoriesTitle;

  @override
  Widget build(BuildContext context) {
    if (state is CheckConnectionState) {
      return FallBackWidget(
        text: 'Please check your connictions ...',
        onTap: () => cubit.getCategoriesDetails(
          categoryName: categoriesTitle,
        ),
      );
    } else if (state is CategoriesDetailsErrorState) {
      return FallBackWidget(
        text: 'Somthing is wrong !',
        onTap: () => cubit.getCategoriesDetails(
          categoryName: categoriesTitle,
        ),
      );
    } else {
      return const CustomCircularProgress(elevation: 2);
    }
  }
}
