import 'package:api/model/res/list_mack_up_model.dart';
import 'package:api/service/list_mack_up_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ListMackUpScreen extends StatelessWidget {
  const ListMackUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mack Up'),
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
      backgroundColor: Colors.grey.shade300,
      body: FutureBuilder(
        future: MackUpService.getProducts(),
        builder:
            (BuildContext context, AsyncSnapshot<List<MackUpModel>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return MasonryGridView.count(
              padding: const EdgeInsets.all(10),
              itemCount: snapshot.data!.length,
              crossAxisCount: 2,
              itemBuilder: (context, index) {
                var info = snapshot.data![index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network('${info.imageLink}'),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          '${info.name}',
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$ ${info.price}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            InkWell(
                              child: GestureDetector(
                                onTap: () {},
                                child: const Icon(Icons.add_shopping_cart),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
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
