import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData lightTheme = ThemeData(
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontSize: 26, fontWeight: FontWeight.w500, color: Colors.black),
      bodyMedium: TextStyle(
          fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),
      bodySmall: TextStyle(
          fontSize: 12, fontWeight: FontWeight.w100, color: Colors.black),
    ),
  );

  static ThemeData darkTheme = ThemeData(
      textTheme: const TextTheme(
    titleLarge: TextStyle(
        fontSize: 26, fontWeight: FontWeight.w500, color: Colors.white),
    bodyMedium: TextStyle(
        fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white),
    bodySmall: TextStyle(
        fontSize: 12, fontWeight: FontWeight.w100, color: Colors.white),
  ));
}
