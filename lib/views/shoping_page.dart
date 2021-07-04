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
      body: Stack(
        children: [
          SafeArea(
              child: Container(
            margin: EdgeInsets.only(top: 220, left: 24, right: 24, bottom: 100),
            child: GetX<ShoppingController>(builder: (controller) {
              return StaggeredGridView.countBuilder(
                // scrollDirection: Axis.vertical,
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
            }),
          )),
          SafeArea(
            child: Container(
              margin: EdgeInsets.fromLTRB(24, 30, 24, 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                          height: 24,
                          width: 24,
                          image: AssetImage('assets/logo.png')),
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
                                  color: Colors.blue, shape: BoxShape.circle),
                              child: Center(
                                child:
                                    GetX<CartController>(builder: (controller) {
                                  return Text(
                                    controller.count.toString(),
                                    style: TextStyle(color: Colors.white),
                                  );
                                }),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 28),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.only(top: 13, left: 17, bottom: 13),
                          height: 50,
                          width: MediaQuery.of(context).size.width - 119,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Row(
                            children: [
                              Image.asset('assets/cari.png'),
                              SizedBox(width: 9),
                              Text(
                                'Search',
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 53,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              image: DecorationImage(
                                  image: AssetImage('assets/Vector.png'))),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            height: 26,
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                color: Colors.blue),
                            child: Text('All')),
                        Container(
                            height: 26,
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                color: Colors.white),
                            child: Text('Adidas')),
                        Container(
                            height: 26,
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                color: Colors.white),
                            child: Text('Converse')),
                        Container(
                            height: 26,
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                color: Colors.white),
                            child: Text('New Balance')),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
