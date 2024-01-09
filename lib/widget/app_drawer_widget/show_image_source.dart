import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../app/cubit/app_cubit.dart';
import '../../app/extensions.dart';
import '../../theme/colors.dart';
import '../../theme/styles.dart';

showImageSource(BuildContext context) {
  return showDialog(
    barrierColor: Colors.black38,
    context: context,
    builder: (context) => AlertDialog(
      title: const Text(
        "Choice Way",
        style: TextStyles.pacifico16SecondPrimaryRegular,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(
              Icons.image_outlined,
              color: AppColors.primaryColor,
            ),
            title: const Text(
              "Gallery",
              style: TextStyles.font14PrimaryRegular,
            ),
            onTap: () =>
                AppCubit.get(context).pickImage().then((_) => context.back()),
          ),
          ListTile(
            leading: const Icon(
              Icons.camera_alt_outlined,
              color: AppColors.primaryColor,
            ),
            title: const Text(
              "Camera",
              style: TextStyles.font14PrimaryRegular,
            ),
            onTap: () => AppCubit.get(context)
                .pickImage(imageSource: ImageSource.camera)
                .then((_) => context.back()),
          ),
        ],
      ),
    ),
  );
}
