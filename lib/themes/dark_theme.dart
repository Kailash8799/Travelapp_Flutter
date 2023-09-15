import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: Colors.blue,
      onPrimary: Colors.white,
      secondary: Colors.grey[900]!,
      onSecondary: Colors.transparent,
      error: Colors.red,
      onError: Colors.red[400]!,
      background: Colors.black,
      onBackground: const Color.fromARGB(55, 237, 242, 247),
      surface: Colors.black,
      onSurface: Colors.grey[700]!,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 1,
    ));
