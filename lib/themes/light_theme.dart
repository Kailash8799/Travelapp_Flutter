import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: Colors.blue,
    onPrimary: Colors.blueAccent,
    secondary: Colors.black26,
    onSecondary: Colors.transparent,
    error: Colors.red,
    onError: Colors.red[400]!,
    background: Colors.white,
    onBackground: Colors.white,
    surface: Colors.lightGreen,
    onSurface: Colors.grey[700]!,
  ),
);
