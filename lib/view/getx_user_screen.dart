import 'package:api/controller/user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class UserDataScreen extends StatefulWidget {
  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  UserController userController = Get.put(UserController());

  AnimationController? animationController;

  var style = const TextStyle(
      fontWeight: FontWeight.w700, fontSize: 15, color: Colors.white);

  var color = const TextStyle(color: Colors.white);

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withAlpha(100),
      appBar: AppBar(
        title: const Text('Info'),
        backgroundColor: Colors.grey.withAlpha(100),
        shape: const OutlineInputBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Obx(
        () {
          if (userController.isLoading.value) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          } else {
            return MasonryGridView.count(
              padding: const EdgeInsets.all(10),
              physics: const BouncingScrollPhysics(),
              itemCount: userController.userList!.results!.length,
              crossAxisCount: 2,
              itemBuilder: (context, index) {
                var info = userController.userList!.results;
                return Card(
                  color: Colors.white.withAlpha(100),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Image.network(
                        '${info![index].picture!.large}',
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Text(
                                '   Name : ',
                                style: style,
                              ),
                              Text(
                                ' ${info[index].name!.title} ',
                                style: color,
                              ),
                              Text('${info[index].name!.first} ', style: color),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${info[index].name!.last} ',
                                      style: color,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                '   Mob.No : ',
                                style: style,
                              ),
                              Text(
                                '${info[index].phone}',
                                style: color,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // Row(
                          //   children: [
                          //     Text(
                          //       'Mail : ',
                          //       style: style,
                          //     ),
                          //     Text(
                          //         '${newUserController.userData!.results![index].email}'),
                          //   ],
                          //  ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          Row(
                            children: [
                              Text(
                                '   Age : ',
                                style: style,
                              ),
                              Text(
                                '${info[index].dob!.age}',
                                style: color,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                '   Gender : ',
                                style: style,
                              ),
                              Text(
                                '${info[index].gender}',
                                style: color,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      )
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
