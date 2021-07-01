import 'package:get/state_manager.dart';

class Product {
  int id;
  String productName;
  String productImage;
  String productDescription;
  double price;

  Product({
    this.id,
    this.productName,
    this.productImage,
    this.productDescription,
    this.price,
  });

  final isFavorite = false.obs;
}
