import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/screens/homescreen.dart';
import 'package:travel_app/screens/onboardingscreen.dart';
import 'package:travel_app/screens/onboardingslider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void transferScreen(bool isOpen, bool isLogin) {
    Timer(const Duration(seconds: 1), () {
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
