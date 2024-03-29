import 'package:flutter/material.dart';
import 'package:store_app/widget/custom_circular_progress.dart';

import '../../../app/cubit/app_cubit.dart';
import '../../../widget/fall_back_connection_widget.dart';

class UserCardFallBackConditional extends StatelessWidget {
  const UserCardFallBackConditional({
    Key? key,
    required this.state,
    required this.cubit,
  }) : super(key: key);

  final AppStates state;
  final AppCubit cubit;

  @override
  Widget build(BuildContext context) {
    if (cubit.cardUser.isEmpty) {
      return const FallBackWidget(
        text: 'Your Card is Empty ...',
        needBottom: false,
      );
    } else {
      return const CustomCircularProgress();
    }
  }
}
