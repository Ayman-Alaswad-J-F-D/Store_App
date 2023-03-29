// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../app/constants.dart';
import '../../app/cubit/app_cubit.dart';
import '../../models/product_model.dart';
import '../../widget/custom_app_bar.dart';
import '../../widget/custom_drawer.dart';
import '../user_card_screen/user_card_screen.dart';

import 'components/product_body.dart';
import 'components/product_fallback_conditional.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  static const String id = 'HomePage';

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    AppCubit.get(context).getProductsData();
    AppCubit.get(context).createDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = AppCubit.get(context);

    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: kWhiteColor,
          appBar: CustomAppBar(
            textTitle: 'New Trend',
            actionWidget: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UserCardScreen(),
                    ),
                  );
                },
                icon: const Icon(
                  FontAwesomeIcons.cartShopping,
                  color: kWhiteColor,
                ),
              ),
              const SizedBox(width: 15),
            ],
          ),
          drawer: const CustomDrawer(),
          body: ConditionalBuilder(
            condition: cubit.listProduct != null,
            builder: (context) {
              List<ProductModel> data = cubit.listProduct!;
              return RefreshIndicator(
                onRefresh: () async {
                  return cubit.getProductsData();
                },
                color: kPrimaryColor,
                child: ProductBody(data: data),
              );
            },
            fallback: (context) =>
                ProductFallBackConditional(state: state, cubit: cubit),
          ),
        );
      },
    );
  }
}
