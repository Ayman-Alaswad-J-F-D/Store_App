import 'package:flutter/material.dart';
import 'package:store_app/widget/custom_app_bar.dart';
import 'package:store_app/widget/custom_drawer.dart';

import 'components/connect_as_body.dart';

class ConnectAsScreen extends StatelessWidget {
  const ConnectAsScreen({Key? key}) : super(key: key);

  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(textTitle: 'Connect As'),
      drawer: const CustomDrawer(),
      body: ConnectAsBody(),
    );
  }
}
