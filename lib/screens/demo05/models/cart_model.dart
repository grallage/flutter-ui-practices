import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  // list of items on sale
  final List<List> _shopItems = [
    // [ itemName, itemPrice, imagePath, color ]
    ["Avocado", "4.00", "assets/demo05/avocado.png", Colors.green],
    ["Banana", "2.50", "assets/demo05/banana.png", Colors.yellow],
    ["Chicken", "12.80", "assets/demo05/chicken.png", Colors.brown],
    ["Water", "1.00", "assets/demo05/water.png", Colors.blue],
  ];
  final List _cartItems = [];

  List<List> get shopItems => _shopItems;

  List get cartItems => _cartItems;

  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
