import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData getTheme() {
    return ThemeData(
      primaryColor: const Color.fromARGB(255, 243, 243, 243),
      cardColor: const Color.fromARGB(255, 255, 255, 255),
      fontFamily: 'Roboto',
      textTheme: const TextTheme(
        titleLarge: TextStyle( fontSize: 26, fontWeight: FontWeight.w500),
        bodyMedium: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w100)
      )
    );
  }
}
