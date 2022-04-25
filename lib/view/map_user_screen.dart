import 'package:api/common/text.dart';
import 'package:api/model/res/map_user_model.dart';
import 'package:api/service/map_user_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AllUserScreen extends StatelessWidget {
  const AllUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withAlpha(100),
      body: FutureBuilder(
        future: UserService.grtUser(),
        builder: (BuildContext context, AsyncSnapshot<UserModel?> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return MasonryGridView.count(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 45),
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data!.results!.length,
              crossAxisCount: 2,
              itemBuilder: (context, index) {
                var info = snapshot.data!.results![index];
                return Card(
                  color: Colors.white.withAlpha(100),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Image.network(
                          '${info.picture!.large}',
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
                                Ts(
                                  text: 'Name',
                                  weight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                                Ts(
                                  text: ' ${info.name!.title} ',
                                  color: Colors.white,
                                ),
                                Ts(
                                  text: ' ${info.name!.first} ',
                                  color: Colors.white,
                                ),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Ts(
                                        text: ' ${info.name!.last} ',
                                        color: Colors.white,
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
                                Ts(
                                  text: 'Mob No : ',
                                  weight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                                Ts(
                                  text: ' ${info.phone} ',
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Ts(
                                  text: 'Gender : ',
                                  weight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                                Ts(
                                  text: '${info.gender}',
                                  color: Colors.white,
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
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
        },
      ),
    );
  }
}
