import 'package:flutter/material.dart';

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
    if (cubit.cardUser.isEmpty && state is! GetDatabaseState) {
      return const CustomCircularProgress();
    } else {
      return const SizedBox();
    }
  }
}
