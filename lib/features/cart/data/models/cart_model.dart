import 'package:foody/constants.dart';

class CartModel {
  final String name;
  final String image;
  final String id;
  final double price;
  final int quantity;

  CartModel(
      {required this.name,
      required this.image,
      required this.id,
      required this.price,
      required this.quantity});

  factory CartModel.fromJson(jsonData) {
    return CartModel(
      name: jsonData[kName],
      image: jsonData[kImage],
      id: jsonData[kId],
      price: jsonData[kPrice],
      quantity: jsonData[kQuantity],
    );
  }
}
