import 'package:flutter/material.dart';
import 'package:flutter_fe/src/home/menu/food_list.dart';
import 'cart_action_button.dart';

class Menu extends StatelessWidget {

  const Menu({super.key});

  static const defaultStyle = TextStyle(height: 3, fontSize: 45);
  static const appTitle = Text('Menu', style: defaultStyle, textAlign: TextAlign.center);

  @override
  Widget build(BuildContext context) {
    return const Column(
        children: [
          appTitle,
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                FoodList(),
                CartActionButton()
              ],
            )
          )
        ]
    );
  }
}