import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/connection/mongodb.dart';
import 'package:travel_app/screens/homescreen.dart';
import 'package:travel_app/screens/onboardingscreen.dart';
import 'package:travel_app/screens/onboardingslider.dart';
import 'package:travel_app/screens/splashscreen.dart';
import 'package:travel_app/themes/dark_theme.dart';
import 'package:travel_app/themes/light_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void dispoceConnection() async {
    await MongoDatabase.close();
  }

  @override
  void initState() {
    super.initState();
    // checkUSerisFirstTimeonApp();
  }

  @override
  void dispose() {
    super.dispose();
    dispoceConnection();
  }

  void transferScreen(bool isOpen, bool isLogin) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => isLogin
                ? const HomeScreen()
                : isOpen
                    ? const OnboardingScreen()
                    : const Onboardingslider(),
          ),
          (route) => false);
    });
  }

  void checkUSerisFirstTimeonApp() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? firsttime = prefs.getString('userfirsttime');
    final String? isLogin = prefs.getString('userloginornot');
    if (firsttime == null) {
      await prefs.setString('userfirsttime', 'Welcome to our app');
      transferScreen(false, false);
    } else if (isLogin == null) {
      transferScreen(true, false);
    } else {
      transferScreen(true, true);
    }
  }

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
