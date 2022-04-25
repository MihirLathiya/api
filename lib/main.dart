import 'package:api/view/cd_all_user_screen.dart';
import 'package:api/view/cd_post_sign_in_screen.dart';
import 'package:api/view/cd_post_sign_up_screen.dart';
import 'package:api/view/getx_mack_up_screen.dart';
import 'package:api/view/getx_user_screen.dart';
import 'package:api/view/home_screen.dart';
import 'package:api/view/list_mackup_screen.dart';
import 'package:api/view/map_user_screen.dart';
import 'package:api/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FontsScreen(),
    );
  }
}
