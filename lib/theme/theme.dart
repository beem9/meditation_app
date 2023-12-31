import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.blue,
  hintColor: Colors.green,
  backgroundColor: Colors.black,
  scaffoldBackgroundColor: Colors.black,
  brightness: Brightness.dark,
  textTheme: TextTheme(
    headline6: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    bodyText2: TextStyle(
      color: Colors.white70,
    ),
  ),
);

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blue,
  hintColor: Colors.green,
  backgroundColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  brightness: Brightness.light,
  textTheme: TextTheme(
    headline6: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    bodyText2: TextStyle(
      color: Colors.black87,
    ),
  ),
);
