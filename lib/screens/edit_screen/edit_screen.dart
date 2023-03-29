// ignore: import_of_legacy_library_into_null_safe
import 'package:conditional_builder/conditional_builder.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:store_app/screens/edit_screen/components/edit_fall_back_condational.dart';

import '../../app/constants.dart';
import '../../app/cubit/app_cubit.dart';
import '../../widget/custom_app_bar.dart';
import '../../widget/custom_snack_bar.dart';
import '../../widget/list_view_animation.dart';
import 'components/custom_list_tile.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  void initState() {
    AppCubit.get(context).updateQuantity.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = AppCubit.get(context);

    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: kPrimaryColor,
          appBar: CustomAppBar(textTitle: 'Edit Product'),
          body: ConditionalBuilder(
            condition: cubit.cardUser.isNotEmpty,
            builder: (context) => AnimationLimiter(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  itemCount: cubit.cardUser.length,
                  separatorBuilder: (context, index) =>
                      const Divider(height: 30, color: kPrimaryColor),
                  itemBuilder: (context, index) {
                    cubit.updateQuantity.add(cubit.cardUser[index].quantity);

                    return Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: kSecondPrimaryColor,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(color: Colors.black26, blurRadius: 3)
                        ],
                      ),
                      child: Column(
                        children: [
                          if (cubit.showDone(index: index))
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Edit',
                                  style: TextStyle(
                                    color: kWhiteColor,
                                    fontSize: 17,
                                  ),
                                ),
                                TextButton.icon(
                                  // style: ButtonStyle(
                                  //   backgroundColor: MaterialStateProperty.all(kSecondPrimaryColor) ,
                                  //   elevation: MaterialStateProperty.all(2),
                                  // ),
                                  icon: const Icon(
                                    Icons.done,
                                    color: kWhiteColor,
                                  ),
                                  onPressed: () => cubit
                                      .updateData(
                                        id: cubit.cardUser[index].id,
                                        quantity: cubit.updateQuantity[index],
                                      )
                                      .then((_) => ScaffoldMessenger.of(context)
                                              .showSnackBar(CustomSnakBar(
                                            text:
                                                'The product has been modified',
                                            backgroundColor:
                                                kSecondPrimaryColor,
                                          ))),
                                  label: const Text(
                                    'Done',
                                    style: TextStyle(color: kWhiteColor),
                                  ),
                                ),
                              ],
                            ),
                          ListViewAnimation(
                            index: index,
                            child: Container(
                              child: CustomListTile(
                                cubit: cubit,
                                index: index,
                                quantity: cubit.updateQuantity,
                              ),
                              height:
                                  MediaQuery.of(context).size.height * 0.115,
                              margin: const EdgeInsets.symmetric(horizontal: 2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: kWhiteColor,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            fallback: (context) =>
                EditFallBackCondational(cubit: cubit, state: state),
          ),
        );
      },
    );
  }
}
