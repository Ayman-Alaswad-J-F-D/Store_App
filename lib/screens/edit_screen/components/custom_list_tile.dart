import 'package:flutter/material.dart';

import '../../../app/constants.dart';
import '../../../app/cubit/app_cubit.dart';
import 'suptitle_widget.dart';
import 'title_widget.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.cubit,
    required this.quantity,
    required this.index,
  }) : super(key: key);

  final AppCubit cubit;
  final List quantity;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        leading: Image.network(
          cubit.cardUser[index].image,
          width: MediaQuery.of(context).size.width * 0.25,
          errorBuilder: (context, error, stackTrace) => const Padding(
            child: CircularProgressIndicator(color: kPrimaryColor),
            padding: EdgeInsets.symmetric(horizontal: 10),
          ),
        ),
        title: TitleWidget(cubit: cubit, index: index),
        subtitle: SuptitleWidget(cubit: cubit, index: index),
        trailing: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: IconButton(
            icon: const Icon(Icons.delete, color: kIconLoveColor),
            onPressed: () =>
                cubit.deleteData(id: cubit.cardUser[index].id, index: index),
          ),
        ),
      ),
    );
  }
}
