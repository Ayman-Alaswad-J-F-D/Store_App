import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.textEditingController,
    required this.typeInput,
    required this.label,
    this.radius = 30.0,
    this.gapPadding = 5.0,
    this.prefixIcon,
    this.prefixIconColor = AppColors.primaryColor,
    this.suffixIcon,
    this.suffixPressed,
    this.onSubmit,
    this.onChange,
    this.onTap,
    this.validate,
    this.isPassword = false,
    this.filledNeed = false,
    this.fillColor = AppColors.whiteColor,
    this.hintText,
    this.colorHintText,
    this.colorLabelText,
    this.cursorColor = AppColors.secondPrimaryColor,
    this.fontSizeHintText,
    this.openEnabled = true,
    this.openHelperText = false,
    this.maxLines = 1,
    this.focusNode,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final TextInputType typeInput;
  final String label;
  final double radius;
  final double gapPadding;
  final Icon? prefixIcon;
  final Color prefixIconColor;
  final IconData? suffixIcon;
  final Function()? suffixPressed;
  final Function(String)? onSubmit;
  final Function(String)? onChange;
  final Function()? onTap;
  final String? Function(String?)? validate;
  final bool isPassword;
  final bool filledNeed;
  final Color? fillColor;
  final String? hintText;
  final Color? colorHintText;
  final Color? colorLabelText;
  final Color cursorColor;
  final double? fontSizeHintText;
  final bool openEnabled;
  final bool openHelperText;
  final int maxLines;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      cursorColor: cursorColor,
      // scrollPhysics: const BouncingScrollPhysics(),
      style: TextStyles.font14PrimaryRegular,
      enabled: openEnabled,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      controller: textEditingController,
      keyboardType: typeInput,
      obscureText: isPassword,
      maxLines: maxLines,
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide.none),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide.none),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide.none),
        helperText: openHelperText ? '  Please edit your information' : null,
        helperStyle: TextStyles.font14SecondPrimaryRegular,
        // disabledBorder: InputBorder.none,
        filled: filledNeed,
        fillColor: filledNeed ? fillColor : AppColors.whiteColor,
        labelText: label,
        labelStyle: TextStyle(color: colorLabelText, fontFamily: 'Pacifico'),
        hintText: hintText,
        hintStyle: TextStyle(
          color: colorHintText,
          fontSize: fontSizeHintText,
          fontStyle: FontStyle.italic,
        ),
        border: InputBorder.none,
        // border: OutlineInputBorder(
        //   gapPadding: gapPadding,
        //   borderRadius: BorderRadius.all(Radius.circular(radius)),
        // ),
        prefixIcon: prefixIcon,
        prefixIconColor: prefixIconColor,
        suffixIcon: suffixIcon != null
            ? IconButton(
                // color: Colors.deepOrange.shade500,
                highlightColor: AppColors.lightGrayColor,
                onPressed: suffixPressed,
                icon: Icon(
                  suffixIcon,
                  color: AppColors.secondPrimaryColor,
                ),
              )
            : null,
      ),
    );
  }
}
