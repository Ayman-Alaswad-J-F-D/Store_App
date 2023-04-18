import 'package:flutter/material.dart';
import 'package:store_app/app/constants.dart';
import 'package:store_app/widget/fall_back_connection_widget.dart';

import '../../../app/cubit/app_cubit.dart';
import '../../../widget/custom_circular_progress.dart';

class EditFallBackCondational extends StatelessWidget {
  const EditFallBackCondational({
    Key? key,
    required this.cubit,
    required this.state,
  }) : super(key: key);

  final AppCubit cubit;
  final AppStates state;

  @override
  Widget build(BuildContext context) {
    if (cubit.cardUser.isEmpty && state is GetDatabaseLoadingState) {
      return const CustomCircularProgress();
    } else {
      return const FallBackWidget(
        text: 'Please back to add a product',
        colorText: kYallowColor,
        needBottom: false,
      );
    }
  }
}
