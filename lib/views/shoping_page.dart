// import 'dart:html';

import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get_x_latihan/controller/cart_controller.dart';
import 'package:get_x_latihan/controller/product_controller.dart';
import 'package:get_x_latihan/shared/theme.dart';
import 'package:get_x_latihan/views/cart_page.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyColor2,
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
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          child: Column(
            children: [
              Expanded(child: GetX<ShoppingController>(builder: (controller) {
                return GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: controller.products
                      .map((element) => GestureDetector(
                            onTap: () {
                              cartController.addToCart(element);
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: 20, left: 13, right: 13, bottom: 8),
                              height: 30,
                              // width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    // color: Colors.amber,
                                    height: 80,
                                    width: 150,
                                    child: Center(
                                        child: Image.asset(
                                      element.productImage,
                                      height: 80,
                                      width: 140,
                                    )),
                                  ),
                                  Text(
                                    element.productName,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    'Rp ${element.price}',
                                    style: TextStyle(color: Colors.black45),
                                  ),
                                ],
                              ),
                            ),
                          ))
                      .toList(),
                );
              })
                  // Expanded(
                  //   child: GetX<ShoppingController>(
                  //     builder: (controller) {
                  //       return ListView.builder(
                  //         itemCount: controller.products.length,
                  //         itemBuilder: (context, index) {
                  //           return Card(
                  //             margin: const EdgeInsets.all(12),
                  //             child: Padding(
                  //               padding: const EdgeInsets.all(16.0),
                  //               child: Column(
                  //                 crossAxisAlignment: CrossAxisAlignment.end,
                  //                 children: [
                  //                   Row(
                  //                     mainAxisAlignment:
                  //                         MainAxisAlignment.spaceBetween,
                  //                     children: [
                  //                       Column(
                  //                         crossAxisAlignment:
                  //                             CrossAxisAlignment.start,
                  //                         children: [
                  //                           Text(
                  //                             '${controller.products[index].productName}',
                  //                             style: TextStyle(fontSize: 24),
                  //                           ),
                  //                           Text(
                  //                               '${controller.products[index].productDescription}'),
                  //                         ],
                  //                       ),
                  //                       Text('\$${controller.products[index].price}',
                  //                           style: TextStyle(fontSize: 24)),
                  //                     ],
                  //                   ),
                  //                   ElevatedButton(
                  //                     onPressed: () {
                  //                       cartController
                  //                           .addToCart(controller.products[index]);
                  //                     },
                  //                     child: Text('Add to Cart'),
                  //                   ),
                  //                   Obx(() => IconButton(
                  //                         icon: controller
                  //                                 .products[index].isFavorite.value
                  //                             ? Icon(Icons.check_box_rounded)
                  //                             : Icon(Icons
                  //                                 .check_box_outline_blank_outlined),
                  //                         onPressed: () {
                  //                           controller.products[index].isFavorite
                  //                               .toggle();
                  //                         },
                  //                       )),
                  //                 ],
                  //               ),
                  //             ),
                  //           );
                  //         },
                  //       );
                  //     },
                  //   ),
                  // ),
                  )
            ],
          ),
        ),
      ),
    );
  }
}
