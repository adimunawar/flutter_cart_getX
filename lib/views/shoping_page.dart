import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_latihan/controller/cart_controller.dart';
import 'package:get_x_latihan/controller/product_controller.dart';
import 'package:get_x_latihan/views/cart_page.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latihan Cart'),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Get.to(CartPage());
                },
              ),
              Positioned(
                top: 3,
                right: 5,
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: Colors.amber, shape: BoxShape.circle),
                  child: Center(
                    child: GetX<CartController>(builder: (controller) {
                      return Text(
                        controller.count.toString(),
                      );
                    }),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.all(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${controller.products[index].productName}',
                                        style: TextStyle(fontSize: 24),
                                      ),
                                      Text(
                                          '${controller.products[index].productDescription}'),
                                    ],
                                  ),
                                  Text('\$${controller.products[index].price}',
                                      style: TextStyle(fontSize: 24)),
                                ],
                              ),
                              RaisedButton(
                                onPressed: () {
                                  // Get.snackbar(
                                  //     "cek your cart", " is alredy added");
                                  cartController
                                      .addToCart(controller.products[index]);
                                },
                                color: Colors.blue,
                                textColor: Colors.white,
                                child: Text('Add to Cart'),
                              ),
                              Obx(() => IconButton(
                                    icon: controller
                                            .products[index].isFavorite.value
                                        ? Icon(Icons.check_box_rounded)
                                        : Icon(Icons
                                            .check_box_outline_blank_outlined),
                                    onPressed: () {
                                      controller.products[index].isFavorite
                                          .toggle();
                                    },
                                  )),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            GetX<CartController>(builder: (controller) {
              return Column(
                children: controller.cartItems
                    .map((element) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(element.product.productName),
                            GetBuilder<CartController>(builder: (controller) {
                              return Container(
                                  height: 30,
                                  color: Colors.amber,
                                  child: Text(element.qty.toString()));
                            }),
                            ElevatedButton(
                              onPressed: () {
                                controller.increasQty(element);
                              },
                              child: Text('add'),
                            )
                          ],
                        ))
                    .toList(),
              );
            }),
            SizedBox(height: 30),
            GetBuilder<CartController>(builder: (controller) {
              return Text('${controller.count2}');
            })
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {},
      //   backgroundColor: Colors.amber,
      //   icon: Icon(
      //     Icons.add_shopping_cart_rounded,
      //     color: Colors.black,
      //   ),
      //   label: GetX<CartController>(builder: (controller) {
      //     return Text(
      //       controller.count.toString(),
      //       style: TextStyle(color: Colors.black, fontSize: 24),
      //     );
      //   }),
      // ),
    );
  }
}
