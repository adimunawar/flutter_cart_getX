import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
// import 'package:get_x_latihan/models/product.dart';
import 'package:get/get.dart';
import 'package:get_x_latihan/controller/cart_controller.dart';
import 'package:get_x_latihan/shared/theme.dart';
import 'package:get_x_latihan/views/widgets/cart_card.dart';

class CartPage extends StatelessWidget {
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: greyColor2,
        appBar: AppBar(
          title: Text('Cart'),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(24, 30, 24, 0),
          child: Stack(
            children: [
              ListView(
                children: [
                  GetX<CartController>(builder: (controller) {
                    return Column(
                        children: cartController.cartItems
                            .map((e) => Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: CartCArd(
                                  function1: () {
                                    cartController.increasQty(e);
                                  },
                                  function2: () {
                                    cartController.decreasqty(cart: e);
                                  },
                                  product: e,
                                )))
                            .toList());
                  }),
                  SizedBox(
                    height: 150,
                  )
                ],
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.only(top: 5),
                    color: greyColor2,
                    width: double.infinity,
                    height: 130,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total', style: TextStyle(fontSize: 18)),
                            GetBuilder<CartController>(builder: (controller) {
                              return Text(
                                'Rp ${controller.count2}',
                                style: TextStyle(fontSize: 20),
                              );
                            }),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 64,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Center(
                            child: Text(
                              'Checkout',
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ));
  }
}
