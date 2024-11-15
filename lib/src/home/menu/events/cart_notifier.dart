import 'package:flutter/material.dart';
import 'package:flutter_fe/src/home/menu/events/menu_cart.dart';

class CartNotifier extends ChangeNotifier {
  List<MenuCart> _cart = [];
  List<MenuCart> get cart => _cart;

  void addToCart(MenuCart menu) {
    _cart.add(menu);
    notifyListeners();
  }

  void removeFromCart() {}

}