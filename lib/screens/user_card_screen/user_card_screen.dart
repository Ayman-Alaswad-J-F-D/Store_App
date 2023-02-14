// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:slimy_card/slimy_card.dart';

import '../../app/constants.dart';
import '../../app/cubit/app_cubit.dart';
import '../../widget/custom_app_bar.dart';
import '../../widget/list_view_animation.dart';
import 'components/user_card_fallback_conditional.dart';
import 'components/user_card_info.dart';
import 'components/user_card_item.dart';

class UserCardScreen extends StatefulWidget {
  const UserCardScreen({Key? key}) : super(key: key);

  @override
  State<UserCardScreen> createState() => _UserCardScreenState();
}

class _UserCardScreenState extends State<UserCardScreen> {
  @override
  void initState() {
    ////////////////// ! Set User Id
    AppCubit.get(context).getUserCard(userId: '3');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        final cubit = AppCubit.get(context);
        return Scaffold(
          appBar: CustomAppBar(textTitle: 'User Card'),
          body: ConditionalBuilder(
            condition: cubit.listCardUsersModel != null &&
                state is UserCardSuccessState,
            builder: (context) => AnimationLimiter(
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SlimyCard(
                  topCardHeight: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width - 20,
                  color: kPrimaryColor,
                  topCardWidget: ListView.separated(
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    itemCount: cubit.listCardUsersModel?.length ?? 0,
                    itemBuilder: (context, index) => ListViewAnimation(
                      index: index,
                      child: UserCardInfo(
                        index: index,
                        cardUsersModel: cubit.listCardUsersModel![index],
                      ),
                    ),
                    separatorBuilder: (context, index) => const Divider(
                      height: 30,
                      thickness: 0.2,
                      color: kWhiteColor,
                    ),
                  ),
                  bottomCardHeight: MediaQuery.of(context).size.height * 0.35,
                  bottomCardWidget: UserCardItem(cubit: cubit, state: state),
                ),
              ),
            ),
            fallback: (context) => UserCardFallBackConditional(
              state: state,
              cubit: cubit,
              // ? Set User Id
              userId: '3',
            ),
          ),
        );
      },
    );
  }
}
