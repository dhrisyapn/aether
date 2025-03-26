import 'package:flutter/material.dart';

class ProductDetails {
  String title;
  String description;
  String price;
  String image;
  String discountPercentage;
  double rating;
  String brand;
  String stock;
  String id;
  String weight;
  String dimensions;
  String warranty;

  ProductDetails({
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.discountPercentage,
    required this.rating,
    required this.brand,
    required this.stock,
    required this.id,
    required this.weight,
    required this.dimensions,
    required this.warranty,
  });
}

class productProvider with ChangeNotifier {
  List<ProductDetails> products = [];
  void addProduct(ProductDetails product) {
    products.add(product);
    notifyListeners();
  }
}
