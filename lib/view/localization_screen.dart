import 'package:api/common/text.dart';
import 'package:api/controller/my_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalizationScreen extends StatefulWidget {
  const LocalizationScreen({Key? key}) : super(key: key);

  @override
  State<LocalizationScreen> createState() => _LocalizationScreenState();
}

class _LocalizationScreenState extends State<LocalizationScreen> {
  MyController myController = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.language),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Ts(
              text: 'hello'.tr,
              size: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                myController.changeLanguage('hi', 'IN');
              },
              child: Ts(
                text: 'Hindi',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                myController.changeLanguage('en', 'US');
              },
              child: Ts(
                text: 'English',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                myController.changeLanguage('fr', 'FR');
              },
              child: Ts(
                text: 'France',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
