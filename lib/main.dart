import 'package:flutter/material.dart';
import 'package:flutter_todo_application/screen/home.dart';
import 'package:day_night_theme_flutter/day_night_theme_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeData _lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
  );
  final ThemeData _darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
  );


  MyApp({Key? key}) : super(key: key);
  


  @override
  Widget build(context) {
    
    return DayNightTheme(
        darkTheme: _darkTheme,
        lightTheme: _lightTheme,
        // sunrise time in 24 hours format
        sunriseHour: 13,
        sunriseMinutes: 0,
        // sunset time in 24 hours format
        sunsetHour: 18,
        sunsetMinutes: 0,
        builder: (selectedTheme) {
          print(Brightness.dark);
          return MaterialApp(
            theme: selectedTheme,
            home: Home(isDark: selectedTheme.brightness == Brightness.dark),
          );
        });
  }
}
