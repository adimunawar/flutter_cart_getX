import 'package:flutter/material.dart';
import 'package:get_x_latihan/models/cart.dart';
import 'package:get_x_latihan/models/product.dart';

class CartCArd extends StatelessWidget {
  final Cart product;
  final Function function1;
  final Function function2;

  CartCArd({this.product, this.function1, this.function2});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 13, right: 13),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.amber[50],
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(width: 80, child: Text(product.product.productName)),
          SizedBox(
            width: 20,
          ),
          SizedBox(
              width: 80, child: Text('Rp ' + product.product.price.toString())),
          SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: function1,
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
            child: Center(
                child: Text(
              product.qty.toString(),
              style: TextStyle(fontSize: 18),
            )),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: function2,
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
    );
  }
}
