import 'package:flutter/material.dart';

import '../../../app/constants.dart';
import '../../../widget/custom_button.dart';
import '../../../widget/custom_circular_progress.dart';
import '../../../widget/custom_snack_bar.dart';
import '../../../widget/cutom_text_field.dart';

class ConnectAsBody extends StatelessWidget {
  ConnectAsBody({Key? key}) : super(key: key);

  final TextEditingController emailControlle = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(
                label: 'Your Email',
                textEditingController: emailControlle,
                typeInput: TextInputType.text,
                colorLableText: kPrimaryColor,
                cursorColor: kPrimaryColor,
                filledNeed: true,
                fillColor: kLightGrayColor,
                validate: (value) {
                  if (value!.isEmpty) {
                    return '* required';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Your Note :',
                  style: TextStyle(color: kPrimaryColor, fontSize: 15),
                ),
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                label: '',
                radius: 15,
                maxLines: 6,
                textEditingController: noteController,
                typeInput: TextInputType.text,
                cursorColor: kPrimaryColor,
                colorLableText: kPrimaryColor,
                filledNeed: true,
                fillColor: kLightGrayColor,
                hintText: 'Note ..',
                colorHintText: kPrimaryColor,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'write something';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'Send',
                height: 10,
                backgroundColor: kPrimaryColor,
                colorText: kYallowColor,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (builder) {
                        return const CustomCircularProgress();
                      },
                    );
                    Future.delayed(const Duration(seconds: 2), () {}).then(
                      (_) {
                        Navigator.pop(context);
                        return ScaffoldMessenger.of(context).showSnackBar(
                          CustomSnakBar(
                            text:
                                'Your message has been received. Thank you for reaching out.',
                          ),
                        );
                      },
                    );
                  }
                },
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'You can contact the administrator via the following mail.\nAdmin Email : buyitproduct@gmail.com',
                  style: TextStyle(
                    color: kLightGrayColor,
                    fontSize: 12,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
