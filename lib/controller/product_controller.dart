import 'package:get/state_manager.dart';
import 'package:get_x_latihan/models/product.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 2));
    var productResult = [
      Product(
          id: 1,
          price: 1000000,
          productDescription: 'some description about product',
          productImage: 'assets/adidas.png',
          productName: 'Adidas'),
      Product(
          id: 3,
          price: 1500000,
          productDescription: 'some description about product',
          productImage: 'assets/nike.png',
          productName: 'Nike'),
      Product(
          id: 4,
          price: 800000,
          productDescription: 'some description about product',
          productImage: 'assets/salomon.png',
          productName: 'Salomon'),
      Product(
          id: 5,
          price: 10050,
          productDescription: 'some description about product',
          productImage: 'assets/duka.png',
          productName: 'Fashion'),
    ];

    products.value = productResult;
  }
}
