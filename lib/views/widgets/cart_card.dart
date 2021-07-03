import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_latihan/controller/cart_controller.dart';
import 'package:get_x_latihan/models/cart.dart';
import 'package:get_x_latihan/models/product.dart';
import 'package:get_x_latihan/shared/theme.dart';

class CartCArd extends StatelessWidget {
  final CartController cartController = Get.find();
  final Cart product;
  final Function function1;
  final Function function2;

  CartCArd({this.product, this.function1, this.function2});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 114,
      padding: EdgeInsets.only(left: 6, top: 10, bottom: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6),
            height: 82,
            width: 82,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: greyColor2),
            child: Center(
              child: Image.asset(product.product.productImage),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.product.productName),
              Text(product.product.productDescription),
              SizedBox(
                height: 30,
              ),
              Text(product.product.price.toString())
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.all(6),
              height: 40,
              decoration: BoxDecoration(
                  color: greyColor2,
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: function2,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(4))),
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
                      child: GetBuilder<CartController>(builder: (controller) {
                        return Center(
                            child: Text(
                          product.qty.toString(),
                          style: TextStyle(fontSize: 18),
                        ));
                      })),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: function1,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      height: 30,
                      width: 30,
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
          )
        ],
      ),
    );
  }
}
