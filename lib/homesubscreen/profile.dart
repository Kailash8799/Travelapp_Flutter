import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/screens/logiinscreen.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Your profile",
                style: TextStyle(
                  fontSize: 27,
                  fontFamily: "Roboto",
                ),
              ),
              const Text("Login to start planning your next trip."),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: TextButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: Colors.orange,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  onPressed: () {
                    Navigator.of(context).push(
                      CupertinoModalPopupRoute(
                        builder: (context) {
                          return const LoginScreen();
                        },
                      ),
                    );
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.only(top: 20, left: 5, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.settings,
                            size: 26,
                            weight: 1,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Settings",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Quicksand",
                              ),
                            ),
                          )
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 1,
                color: Colors.grey[200]!,
              ),
              InkWell(
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.only(top: 20, left: 5, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.settings_suggest_outlined,
                            size: 29,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Accessibility",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Quicksand",
                              ),
                            ),
                          )
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 1,
                color: Colors.grey[200]!,
              ),
              InkWell(
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.only(top: 20, left: 5, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.help_outline,
                            size: 26,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Get help",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Quicksand",
                              ),
                            ),
                          )
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 1,
                color: Colors.grey[200]!,
              ),
              InkWell(
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.only(top: 20, left: 5, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.menu_book_outlined,
                            size: 26,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Terms of service",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Quicksand",
                              ),
                            ),
                          )
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 1,
                color: Colors.grey[200]!,
              ),
              InkWell(
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.only(top: 20, left: 5, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.policy_outlined,
                            size: 26,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Privacy Policy",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Quicksand",
                              ),
                            ),
                          )
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
