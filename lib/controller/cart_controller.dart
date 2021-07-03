import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get_x_latihan/models/cart.dart';
import 'package:get_x_latihan/models/product.dart';
import 'package:get/get.dart';
import 'package:get_x_latihan/shared/theme.dart';
import 'package:uuid/uuid.dart';

class CartController extends GetxController {
  static CartController instance = Get.find();
  final cart = Cart().obs;

  var cartItems = <Cart>[].obs;
  int get count => cartItems.length;
  var count2 = 0.0;
  double get totalPrice =>
      cartItems.fold(0, (sum, item) => sum + item.product.price * item.qty);

  void addToCart(Product product) {
    try {
      if (isAlredyAdded(product)) {
        Get.snackbar("cek your cart", "${product.productName} is alredy added",
            backgroundColor: mainColor, duration: Duration(seconds: 1));
        print('udah di added');
      } else {
        var uuid = Uuid();
        String itemId = uuid.v4();
        cartItems.add(Cart(
          id: itemId,
          product: product,
          qty: 1,
        ));
        getTotalsMount();
        update();
      }
    } catch (e) {}
  }

  bool isAlredyAdded(Product product) =>
      cartItems.where((item) => item.product.id == product.id).isNotEmpty;

  void decreasqty({
    Cart cart,
  }) {
    if (cart.qty == 1) {
      removeCart(cart);

      Get.snackbar("berhasil", "item berhasil terhapus",
          duration: Duration(seconds: 1));
    } else {
      int index = cartItems.indexWhere((e) => e.id == cart.id);
      cartItems[index].qty = --cart.qty;
      getTotalsMount();
      update();
    }
  }

  void increasQty(Cart cart) {
    if (cart.qty >= 1) {
      cart.toggleDone();
      getTotalsMount();
      update();
    }
  }

  void removeCart(Cart cart) {
    cartItems.remove(cart);
    getTotalsMount();
    update();
  }

  void getTotalsMount() {
    double totalamount =
        cartItems.fold(0, (sum, item) => sum + item.product.price * item.qty);
    count2 = totalamount;
  }
}
