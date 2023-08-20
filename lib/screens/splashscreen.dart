import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/screens/homescreen.dart';
import 'package:travel_app/screens/onboardingscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void transferScreen(bool isOpen) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              !isOpen ? const OnboardingScreen() : const HomeScreen(),
        ),
      );
    });
  }

  void checkUSerisFirstTimeonApp() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? action = prefs.getString('userfirsttime');
    if (action == null) {
      await prefs.setString('userfirsttime', 'Welcome to our app');
      transferScreen(false);
    } else {
      transferScreen(true);
    }
  }

  @override
  void initState() {
    super.initState();
    checkUSerisFirstTimeonApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: const SafeArea(child: Center(child: Text("Loading..."))),
    );
  }
}
