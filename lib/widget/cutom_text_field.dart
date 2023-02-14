import 'package:flutter/material.dart';
import 'package:store_app/app/constants.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    required this.textEditingController,
    required this.typeInput,
    required this.label,
    this.radius = 30.0,
    this.gapPadding = 5.0,
    this.prefixIcon,
    this.prefixIconColor = kPrimaryColor,
    this.suffixIcon,
    this.suffixPressed,
    this.onSubmit,
    this.onChange,
    this.onTap,
    this.validate,
    this.isPassword = false,
    this.filledNeed = false,
    this.fillColor,
    this.hintText,
    this.colorHintText,
    this.colorLableText,
    this.cursorColor,
    this.fontSizeHintText,
    this.openEnabled = true,
    this.openHelberText = false,
    this.maxLines,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final TextInputType typeInput;
  final String label;
  double radius;
  double gapPadding;
  Icon? prefixIcon;
  Color prefixIconColor;
  IconData? suffixIcon;
  Function()? suffixPressed;
  Function(String)? onSubmit;
  Function(String)? onChange;
  Function()? onTap;
  String? Function(String?)? validate;
  bool isPassword;
  bool filledNeed;
  Color? fillColor = Colors.white;
  String? hintText;
  Color? colorHintText;
  Color? colorLableText;
  Color? cursorColor;
  double? fontSizeHintText;
  bool openEnabled;
  bool openHelberText;
  int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: cursorColor,
      // scrollPhysics: const BouncingScrollPhysics(),
      style: const TextStyle(color: kPrimaryColor),
      enabled: openEnabled,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      controller: textEditingController,
      keyboardType: typeInput,
      obscureText: isPassword,
      maxLines: maxLines,

      // style: const TextStyle(color: Colors.indigo),
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
        helperText: openHelberText ? '  Please edit your information' : null,
        helperStyle: const TextStyle(color: kSecondPrimaryColor),
        // disabledBorder: InputBorder.none,
        filled: filledNeed,
        fillColor: filledNeed ? fillColor : Colors.white,
        labelText: label,
        labelStyle: TextStyle(color: colorLableText, fontFamily: 'Pacifico'),
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
                highlightColor: kLightGrayColor,
                onPressed: suffixPressed,
                icon: Icon(
                  suffixIcon,
                  color: kPrimaryTextColor,
                ),
              )
            : null,
      ),
    );
  }
}
