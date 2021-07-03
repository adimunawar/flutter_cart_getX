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
          productImage: 'assets/converce.png',
          productName: 'Converce'),
      Product(
          id: 2,
          price: 1500000,
          productDescription: 'some description about product',
          productImage: 'assets/nike2.png',
          productName: 'Nike'),
      Product(
          id: 3,
          price: 800000,
          productDescription: 'some description about product',
          productImage: 'assets/adidas.png',
          productName: ' Adidas NMD'),
      Product(
          id: 4,
          price: 10050,
          productDescription: 'some description about product',
          productImage: 'assets/duka.png',
          productName: 'Fashion'),
    ];

    products.value = productResult;
  }
}
