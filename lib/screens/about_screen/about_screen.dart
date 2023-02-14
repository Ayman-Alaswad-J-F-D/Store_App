import 'package:flutter/material.dart';
import 'package:store_app/app/constants.dart';
import 'package:store_app/widget/custom_app_bar.dart';
import 'package:store_app/widget/custom_drawer.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(textTitle: 'About'),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
              child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Image.asset(
                  'assets/images/icon_app.jpg',
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Your path to learning English, step by step Cambridge English Qualifications are in-depth exams that make learning English enjoyable, effective and rewarding. Our unique approach encourages continuous progression with a clear path to improve language skills. We have qualifications for schools, general and higher education, and business.',
              style: TextStyle(color: kGrayColor, fontSize: 20),
            ),
            // Row(
            //   children: [
            //     IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
            //     IconButton(onPressed: () {}, icon: const Icon(Icons.)),
            //     IconButton(onPressed: () {}, icon: const Icon(Icons.share))
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
