import 'package:flutter/material.dart';
import 'package:flutter_application_1/products/cart_controller.dart';

import 'package:get/get.dart';

class UserCartScreen extends StatelessWidget {
  const UserCartScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('User Cart'),
        ),
        body: GetX<CartController>(
          builder: ((controller) {
            return Column(children: [
              SizedBox(
                height: 500,
                child: ListView.builder(
                    itemCount: controller.selectedProducts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Image.network(
                            controller.selectedProducts[index].imageUrl),
                        title: Text(
                            controller.selectedProducts[index].productName),
                        subtitle: Text(controller.selectedProducts[index].price
                            .toString()),
                        trailing: ElevatedButton(
                            onPressed: () {
                              controller.removeProductsFromCart(
                                  controller.selectedProducts[index]);
                            },
                            child: const Icon(Icons.remove)),
                      );
                    }),
              ),
              const SizedBox(height: 10),
              Text(
                'Total Price : Rs. ${controller.totalCost}',
                style: const TextStyle(fontSize: 30.0),
              )
            ]);
          }),
        ));
  }
}
