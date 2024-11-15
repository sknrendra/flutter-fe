import 'package:flutter/material.dart';

Color backgroundColor = Color(0xFFFCF5EB);
Color primaryColor = Color(0XFF25D366);

ThemeData appTheme = ThemeData(
  // brightness: Brightness.light,
  // appBarTheme: AppBarTheme(
  //   backgroundColor: backgroundColor,
  // ),
  // primaryColor: primaryColor,
  // scaffoldBackgroundColor: backgroundColor
  colorScheme: ColorScheme.fromSeed(seedColor: backgroundColor)
  // Add other theme properties as necessary
);