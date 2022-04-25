import 'dart:async';
import 'package:api/common/const.dart';
import 'package:api/view/cd_post_sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cd_all_user_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;
  String? done;

  hello() {
    final data = storage.read('user');
    setState(() {
      done = data;
    });
  }

  @override
  void initState() {
    hello();
    timer = Timer(
      const Duration(seconds: 3),
      () {
        Get.off(() => done == null ? SignInScreen() : AllUserScreens());
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
    );
  }
}
