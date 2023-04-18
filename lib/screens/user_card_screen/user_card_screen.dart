// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../app/constants.dart';
import '../../app/cubit/app_cubit.dart';
import '../../widget/custom_app_bar.dart';
import '../../widget/list_view_animation.dart';
import 'components/user_card_bottom_sheet.dart';
import 'components/user_card_fallback_conditional.dart';
import 'components/user_card_info.dart';

class UserCardScreen extends StatelessWidget {
  const UserCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        final cubit = AppCubit.get(context);
        return Scaffold(
          appBar: CustomAppBar(textTitle: 'User Card'),
          body: ConditionalBuilder(
            condition: cubit.cardUser.isNotEmpty,
            builder: (context) => Container(
              margin: const EdgeInsets.only(
                top: 10,
                right: 10,
                left: 10,
                bottom: 70,
              ),
              child: AnimationLimiter(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  itemCount: cubit.cardUser.length,
                  itemBuilder: (context, index) => Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: CircleAvatar(
                          child: Text((index + 1).toString()),
                          backgroundColor: kSecondPrimaryColor,
                          foregroundColor: kWhiteColor,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 8,
                        child: ListViewAnimation(
                          child: UserCardInfo(index: index),
                          index: index,
                        ),
                      ),
                    ],
                  ),
                  separatorBuilder: (context, index) =>
                      const Divider(color: kWhiteColor, height: 25),
                ),
              ),
            ),
            fallback: (context) =>
                UserCardFallBackConditional(state: state, cubit: cubit),
          ),
          bottomSheet: UserCardBottomSheet(cubit: cubit),
        );
      },
    );
  }
}
// SlimyCard(
//                         width: MediaQuery.of(context).size.width - 20,
//                         topCardHeight:
//                             MediaQuery.of(context).size.height * 0.35,
//                         color: kPrimaryColor,
//                         topCardWidget: ListView.separated(
//                           physics: const BouncingScrollPhysics(
//                             parent: AlwaysScrollableScrollPhysics(),
//                           ),
//                           itemCount: cubit.cardUser.length,
//                           itemBuilder: (context, index) => ListViewAnimation(
//                             child: UserCardInfo(index: index),
//                             index: index,
//                           ),
//                           separatorBuilder: (context, index) => const Divider(
//                             color: kWhiteColor,
//                             thickness: 0.1,
//                             height: 25,
//                           ),
//                         ),
//                         bottomCardHeight:
//                             MediaQuery.of(context).size.height * 0.35,
//                         bottomCardWidget: ListView.separated(
//                           padding: const EdgeInsets.all(4),
//                           physics: const BouncingScrollPhysics(
//                             parent: AlwaysScrollableScrollPhysics(),
//                           ),
//                           itemCount: cubit.cardUser.length,
//                           itemBuilder: (context, index) => ListViewAnimation(
//                             child: UserCardItem(index: index),
//                             index: index,
//                           ),
//                           separatorBuilder: (context, index) => const Divider(
//                             color: kWhiteColor,
//                             thickness: 0.1,
//                             height: 25,
//                           ),
//                         ),
//                       ),
                    