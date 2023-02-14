import 'package:flutter/material.dart';

import '../../../app/cubit/app_cubit.dart';
import '../../../widget/custom_circular_progress.dart';
import '../../../widget/fall_back_connection_widget.dart';

class ProductFallBackConditional extends StatelessWidget {
  const ProductFallBackConditional({
    Key? key,
    required this.state,
    required this.cubit,
  }) : super(key: key);

  final AppStates state;
  final AppCubit cubit;

  @override
  Widget build(BuildContext context) {
    if (state is CheckConnectionState) {
      return FallBackWidget(
        text: 'Please check your connection ..',
        onTap: () => cubit.getProductsData(),
      );
    } else if (state is ProductsErrorState) {
      return FallBackWidget(
        text: 'Somthing is wrong !',
        onTap: () => cubit.getProductsData(),
      );
    } else {
      return const CustomCircularProgress(elevation: 2);
    }
  }
}
