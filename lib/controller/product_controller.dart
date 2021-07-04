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
          productDescription: 'mens Shoes',
          productImage: 'assets/converce.png',
          productName: 'Converse'),
      Product(
          id: 2,
          price: 1500000,
          productDescription: 'mens Shoes',
          productImage: 'assets/nike2.png',
          productName: 'Nike'),
      Product(
          id: 3,
          price: 800000,
          productDescription: 'mens Shoes',
          productImage: 'assets/adidas.png',
          productName: 'Adidas NMD'),
      Product(
          id: 4,
          price: 10050,
          productDescription: 'mens Shoes',
          productImage: 'assets/duka.png',
          productName: 'Fashion'),
      Product(
          id: 5,
          price: 800000,
          productDescription: 'mens Shoes',
          productImage: 'assets/adidas.png',
          productName: 'Adidas NMD'),
      Product(
          id: 6,
          price: 10050,
          productDescription: 'mens Shoes',
          productImage: 'assets/duka.png',
          productName: 'Fashion'),
    ];

    products.value = productResult;
  }
}
