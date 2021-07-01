import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
// import 'package:get_x_latihan/models/product.dart';
import 'package:get/get.dart';
import 'package:get_x_latihan/controller/cart_controller.dart';
import 'package:get_x_latihan/views/widgets/cart_card.dart';

class CartPage extends StatelessWidget {
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cart Page'),
        ),
        body: Stack(
          children: [
            GetX<CartController>(builder: (controller) {
              return ListView.builder(
                  itemCount: controller.cartItems.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Container(
                        color: Colors.amber,
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(controller
                                .cartItems[index].product.productName),
                            GestureDetector(
                              onTap: () {
                                // print('pressed');
                                cartController.decreasqty(
                                  cart: controller.cartItems[index],
                                );
                              },
                              child: Container(
                                height: 30,
                                width: 40,
                                color: Colors.white,
                                child: Center(
                                    child: Text(
                                  '-',
                                  style: TextStyle(fontSize: 24),
                                )),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                                height: 30,
                                width: 30,
                                color: Colors.white,
                                child: GetBuilder<CartController>(
                                    builder: (controller) {
                                  return Center(
                                      child: Text(
                                    cartController.cartItems[index].qty
                                        .toString(),
                                    style: TextStyle(fontSize: 18),
                                  ));
                                })),
                            SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                cartController
                                    .increasQty(controller.cartItems[index]);
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                color: Colors.white,
                                child: Center(
                                    child: Text(
                                  '+',
                                  style: TextStyle(fontSize: 24),
                                )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }),
            Align(
                alignment: Alignment.center,
                child:
                    // Obx(() => Text(cartController.totalPrice.toString()))
                    GetBuilder<CartController>(builder: (controller) {
                  return (controller.count2 == 0)
                      ? Text("nothing")
                      : Text(
                          'Total : Rp ${controller.count2}',
                          style: TextStyle(fontSize: 30),
                        );
                })),
          ],
        ));
  }
}
