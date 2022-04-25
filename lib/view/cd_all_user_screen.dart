import 'package:api/common/const.dart';
import 'package:api/common/text.dart';
import 'package:api/controller/cd_all_user_controller.dart';
import 'package:api/view/cd_post_sign_in_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllUserScreens extends StatelessWidget {
  AllUserController allUserController = Get.put(AllUserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              storage.remove('user').then(
                    (value) => Get.off(
                      () => SignInScreen(),
                    ),
                  );
            },
            icon: const Icon(Icons.login_outlined),
          ),
        ],
      ),
      body: Obx(
        () {
          if (allUserController.isLoading.value) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: allUserController.userList!.users!.length,
              itemBuilder: (context, index) {
                var info = allUserController.userList!.users![index];
                return ListTile(
                  leading: Ts(
                    text: '${info.id}',
                  ),
                  subtitle: Ts(
                    text: '${info.username}',
                  ),
                  title: Row(
                    children: [
                      Ts(
                        text: '${info.firstName} ',
                      ),
                      Ts(
                        text: '${info.lastName}',
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
