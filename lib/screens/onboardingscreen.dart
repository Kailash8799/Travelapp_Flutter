import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/screens/homescreen.dart';
import 'package:travel_app/screens/logiinscreen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  late Animation animate;
  late AnimationController controller;
  final TextEditingController _location = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2,
      ),
    );
    animate = Tween(begin: 100.0, end: 300.0).animate(controller);
    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: SizedBox(
                height: 200,
                width: 400,
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: double.parse((animate.value).toString()),
                    width: double.parse((animate.value).toString()),
                    child: Image.asset(
                        fit: BoxFit.cover, "assets/images/applogo.png"),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0, left: 30, right: 30),
              child: TextFormField(
                controller: _location,
                decoration: const InputDecoration(
                  prefixIcon: InkWell(child: Icon(Icons.search)),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  hintText: "City name",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.orange,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.orange,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.red,
                    ),
                  ),
                ),
                textAlignVertical: TextAlignVertical.center,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 15,
                  height: 1,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 70),
              child: Text(
                "Choose your city",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Text(
                    "Discover the world",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "with ease using our innovative",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "travel app!",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 30, right: 30),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) {
                      return const HomeScreen();
                    },
                  ));
                },
                style:
                    ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
                child: const Text("Get Started"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    CupertinoModalPopupRoute(
                      builder: (context) {
                        return const LoginScreen();
                      },
                    ),
                  );
                },
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Already have an account?",
                        style: TextStyle(
                          color: Colors.black26,
                        ),
                      ),
                      TextSpan(
                        text: "  Log in",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
