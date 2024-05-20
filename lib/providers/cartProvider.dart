import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  int get cartItemCount => _cartItems.length;

  void addToCart(Map<String, dynamic> product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(Map<String, dynamic> product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  double get totalPrice {
    return _cartItems.fold(0.0, (sum, item) => sum + item['price']);
  }
}
