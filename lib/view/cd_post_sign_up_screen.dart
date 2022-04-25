import 'package:api/common/const.dart';
import 'package:api/common/text.dart';
import 'package:api/controller/show_pass_controller.dart';
import 'package:api/model/req/cd_post_sign_up_model.dart';
import 'package:api/service/cd_post_sign_up_service.dart';
import 'package:api/view/cd_all_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

class SignUpScreen extends StatelessWidget {
  ShowPasswordController showPasswordController =
      Get.put(ShowPasswordController());
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey formKey = GlobalKey<FormState>();
  bool isShow = true;

  @override
  Widget build(BuildContext context) {
    print('==========================     Done');

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey.withAlpha(100),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: firstName,
                  validator: (value) {},
                  decoration: const InputDecoration(
                    hintText: 'First Name',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: lastName,
                  validator: (value) {
                    if (value!.isValidEmail()) {}
                  },
                  decoration: const InputDecoration(
                    hintText: 'Last Name',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: userName,
                  validator: (value) {},
                  decoration: const InputDecoration(
                    hintText: 'Username',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => TextFormField(
                    controller: password,
                    validator: (value) {},
                    obscureText: showPasswordController.isShow.value,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      suffixIcon: IconButton(
                        splashRadius: 20,
                        splashColor: Colors.blue.withAlpha(100),
                        onPressed: () {
                          showPasswordController.isShowing();
                        },
                        icon: showPasswordController.isShow.value
                            ? const Icon(Icons.visibility_outlined)
                            : const Icon(Icons.visibility_off_outlined),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () async {
                    SignUpReqModel info = SignUpReqModel();
                    info.firstName = firstName.text;
                    info.lastName = lastName.text;
                    info.avatar = '';
                    info.username = userName.text;
                    info.password = password.text;

                    bool? status =
                        await SignUpServices.signUp(reqBody: info.toJson());
                    if (status == true) {
                      Get.off(() => AllUserScreens());
                    }
                  },
                  child: Ts(text: 'SignUp'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
