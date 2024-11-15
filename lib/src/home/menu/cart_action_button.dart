import 'package:flutter/material.dart';
import 'events/menu_cart.dart';

class CartActionButton extends StatefulWidget {
  const CartActionButton({super.key});
  @override
  State<StatefulWidget> createState() => CartActionButtonState();
}

class CartActionButtonState extends State<CartActionButton> {

  List<MenuCart> cart = [];

  int get cartCount => cart.length;
  int get cartTotalPrice => cart.fold(0, (previousValue , cartItem) => previousValue  + cartItem.price);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          onPressed: () {},
          child: Text("($cartCount) Rp. $cartTotalPrice"),
        )
    );
  }
}

