// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
                return StaggeredGridView.countBuilder(
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 2,
                  itemCount: controller.products.length,
                  crossAxisSpacing: 16,
                  itemBuilder: (contex, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: GestureDetector(
                        onTap: () {
                          cartController.addToCart(controller.products[index]);
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                            top: 20,
                            left: 13,
                            right: 13,
                          ),
                          height: 187,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  height: 17,
                                  width: 14,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('assets/save.png')),
                                    // color: Colors.amber,
                                  ),
                                ),
                              ),
                              Container(
                                height: 80,
                                width: 130,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage(
                                      controller.products[index].productImage),
                                  fit: BoxFit.fitWidth,
                                )),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                controller.products[index].productName,
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Rp ${controller.products[index].price}',
                                style: TextStyle(
                                    color: Colors.black45, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                );
              }))
            ],
          ),
        ),
      ),
    );
  }
}
