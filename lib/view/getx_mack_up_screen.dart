import 'package:api/controller/mack_up_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class MackUpItemScreen extends StatelessWidget {
  MackUpController mackUpController = Get.put(MackUpController());
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
      body: Obx(
        () {
          if (mackUpController.isLoading.value) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          } else {
            return MasonryGridView.count(
              padding: EdgeInsets.all(10),
              itemCount: mackUpController.product.length,
              crossAxisCount: 2,
              itemBuilder: (context, index) {
                var info = mackUpController.product;
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 200,
                          child: Image.network("${info[index].imageLink}"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("${info[index].name}"),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("\$ ${info[index].price}"),
                            GestureDetector(
                              onTap: () {},
                              child: const Icon(Icons.add_shopping_cart),
                            )
                          ],
                        ),
                      ],
                    ),
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
