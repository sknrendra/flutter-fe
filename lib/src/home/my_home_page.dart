import 'package:flutter/material.dart';
import 'package:flutter_fe/src/home/app_bar.dart';
import 'menu/menu.dart';


class MyHomePage extends StatelessWidget {

  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      appBar: CustomAppBar(),
      body: Menu()
    );
  }
}