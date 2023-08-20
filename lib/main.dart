import 'package:flutter/material.dart';
import 'package:travel_app/screens/splashscreen.dart';
import 'package:travel_app/themes/dark_theme.dart';
import 'package:travel_app/themes/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      themeMode: ThemeMode.system,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      // home: const LoginScreen(),
      // home: const OnboardingScreen(),
    );
  }
}
