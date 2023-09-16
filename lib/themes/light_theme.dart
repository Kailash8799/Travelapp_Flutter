import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: Colors.orange,
    onPrimary: Colors.black,
    secondary: Colors.black26,
    onSecondary: Colors.grey[500]!,
    error: Colors.red,
    onError: Colors.red[400]!,
    background: Colors.white,
    onBackground: const Color.fromARGB(255, 23, 29, 32),
    surface: Colors.white,
    onSurface: Colors.grey[700]!,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: Colors.white,
      fontSize: 10,
    ),
    titleLarge: TextStyle(
      color: Colors.black,
    ),
  ),
);
