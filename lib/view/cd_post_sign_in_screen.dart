import 'package:api/common/const.dart';
import 'package:api/common/text.dart';
import 'package:api/controller/show_pass_controller.dart';
import 'package:api/model/req/cd_post_sign_in_model.dart';
import 'package:api/service/cd_sign_in_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'getx_mack_up_screen.dart';

class SignInScreen extends StatelessWidget {
  ShowPasswordController showPasswordController =
      Get.put(ShowPasswordController());
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey formKey = GlobalKey<FormState>();

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
                    SignInModel detail = SignInModel();

                    detail.username = userName.text;
                    detail.password = password.text;

                    bool? status = await SignInService()
                        .signInUser(reqBody: detail.toJson()).catchError((e){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e),),)
                    });
                    if (status == true) {
                      storage
                          .write('user', userName.text)
                          .then((value) => Get.to(
                                () => MackUpItemScreen(),
                              ));
                    }
                  },
                  child: Ts(text: 'Log In'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
