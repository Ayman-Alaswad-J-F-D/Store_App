import 'package:flutter/material.dart';

import '../../../app/cubit/app_cubit.dart';
import '../../../widget/custom_circular_progress.dart';
import '../../../widget/fall_back_connection_widget.dart';

class UserCardFallBackConditional extends StatelessWidget {
  const UserCardFallBackConditional({
    Key? key,
    required this.state,
    required this.cubit,
    required this.userId,
  }) : super(key: key);

  final AppStates state;
  final AppCubit cubit;
  final String userId;

  @override
  Widget build(BuildContext context) {
    if (state is CheckConnectionState) {
      return FallBackWidget(
        text: 'Please check your connection ..',
        onTap: () => cubit.getUserCard(userId: userId),
      );
    } else if (state is UserCardErrorState) {
      return FallBackWidget(
        text: 'Somthing is wrong !',
        onTap: () => cubit.getUserCard(userId: userId),
      );
    } else {
      return const CustomCircularProgress(elevation: 2);
    }
  }
}
