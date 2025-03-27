import 'dart:convert';

import 'package:aether/model/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ProductFunctions {
  BuildContext context;
  ProductFunctions(this.context);
  Future<bool> getProduct() async {
    String url = 'https://dummyjson.com/products';
    var response = await http.get(Uri.parse(url));
    debugPrint(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List products = data['products'];

      for (var product in products) {
        Provider.of<productProvider>(context, listen: false).addProduct(
          ProductDetails(
            title: product['title'],
            description: product['description'],
            price: product['price'].toString(),
            image: product['images'][0],
            discountPercentage: product['discountPercentage'].toString(),
            rating: product['rating'].toDouble(),
            brand: product['brand'] ?? 'not available',
            stock: product['stock'].toString(),
            id: product['id'].toString(),
            weight: product['weight'].toString(),
            dimensions:
                "${product['dimensions']['width']}x${product['dimensions']['height']}x${product['dimensions']['depth']}",
            warranty: product['warrantyInformation'] ?? 'No warranty info',
          ),
        );
      }
      return true;
    } else {
      debugPrint('Failed to fetch products: ${response.statusCode}');
      return false;
    }
  }
}
