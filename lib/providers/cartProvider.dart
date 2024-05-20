import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  int get cartItemCount => _cartItems.length;

  void addToCart(Map<String, dynamic> product) {
    // Check if the product is already in the cart
    if (_cartItems.any((item) => item['id'] == product['id'])) {
      // Product already in the cart
      return;
    }

    _cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(Map<String, dynamic> product) {
    _cartItems.removeWhere((item) => item['id'] == product['id']);
    notifyListeners();
  }
}
