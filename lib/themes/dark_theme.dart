import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: Colors.blue,
      onPrimary: Colors.blueAccent,
      secondary: Colors.grey[300]!,
      onSecondary: Colors.transparent,
      error: Colors.red,
      onError: Colors.red[400]!,
      background: Colors.black,
      onBackground: Colors.black,
      surface: Colors.lightGreen,
      onSurface: Colors.grey[700]!,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 1,
    ));
