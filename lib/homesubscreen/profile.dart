import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/realm/realm_services.dart';
import 'package:travel_app/screens/logiinscreen.dart';
import 'package:travel_app/screens/notificationscreen.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  bool loading = false;
  bool isLogin = false;

  void isuserLogin() async {
    final realmServices = Provider.of<RealmServices>(context, listen: false);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? logintoken = prefs.getString('userloginornot');
    if (logintoken != null &&
        realmServices.currentUser != null &&
        realmServices.currentUser!.provider != AuthProviderType.anonymous) {
      setState(() {
        isLogin = true;
      });
    } else {
      setState(() {
        isLogin = false;
      });
    }
    setState(() {
      loading = false;
    });
  }

  Future<void> _logOut() async {
    final realmServices = Provider.of<RealmServices>(context, listen: false);
    await realmServices.logout();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("userloginornot");
  }

  @override
  void initState() {
    setState(() {
      loading = true;
    });
    isuserLogin();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : isLogin
              ? SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 19, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 34,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Profile",
                              style: TextStyle(
                                fontSize: 27,
                                fontFamily: "Roboto",
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).push(CupertinoPageRoute(
                                  builder: (context) {
                                    return const NotificationScreen();
                                  },
                                ));
                              },
                              icon: const Icon(
                                Icons.notifications,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: InkWell(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.pink,
                                          maxRadius: 25,
                                          minRadius: 25,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 15),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Kailash",
                                                style: TextStyle(fontSize: 17),
                                              ),
                                              Text(
                                                "Show profile",
                                                style: TextStyle(
                                                    fontFamily: "Quicksand"),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 26,
                                    ),
                                  ],
                                ),
                              ),
                            )),
                        Container(
                          height: 1,
                          color: Colors.grey[200]!,
                        ),
                        SizedBox(
                          height: 140,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Card(
                              shadowColor: Colors.white,
                              surfaceTintColor:
                                  const Color.fromRGBO(102, 221, 111, 0.3),
                              child: Container(),
                            ),
                          ),
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey[200]!,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 25, bottom: 10),
                          child: Text(
                            "Settings",
                            style: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.w900,
                              fontFamily: "Quicksand",
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding:
                                EdgeInsets.only(top: 20, left: 5, bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.person,
                                      size: 22,
                                      weight: 1,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Personal information",
                                        style: TextStyle(
                                          fontSize: 15,
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
                            padding:
                                EdgeInsets.only(top: 20, left: 5, bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.security,
                                      size: 23,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Login & security",
                                        style: TextStyle(
                                          fontSize: 15,
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
                            padding:
                                EdgeInsets.only(top: 20, left: 5, bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.payments_rounded,
                                      size: 22,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Payments and payouts",
                                        style: TextStyle(
                                          fontSize: 15,
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
                            padding:
                                EdgeInsets.only(top: 20, left: 5, bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.accessibility,
                                      size: 22,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Accessibility",
                                        style: TextStyle(
                                          fontSize: 15,
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
                            padding:
                                EdgeInsets.only(top: 20, left: 5, bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.picture_as_pdf_rounded,
                                      size: 22,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Taxes",
                                        style: TextStyle(
                                          fontSize: 15,
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
                        const Padding(
                          padding: EdgeInsets.only(top: 25, bottom: 10),
                          child: Text(
                            "Support",
                            style: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.w900,
                              fontFamily: "Quicksand",
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding:
                                EdgeInsets.only(top: 20, left: 5, bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.help,
                                        size: 22,
                                        weight: 1,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Text(
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: true,
                                            maxLines: 1,
                                            "Visit the Help Center",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: "Quicksand",
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
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
                            padding:
                                EdgeInsets.only(top: 20, left: 5, bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.health_and_safety_sharp,
                                      size: 24,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Get help with a safety issue",
                                        style: TextStyle(
                                          fontSize: 15,
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
                            padding:
                                EdgeInsets.only(top: 20, left: 5, bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.report,
                                      size: 22,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Report a neighborhood concern",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: "Quicksand",
                                          overflow: TextOverflow.ellipsis,
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
                            padding:
                                EdgeInsets.only(top: 20, left: 5, bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.menu_book_outlined,
                                      size: 22,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "How Airtravel works",
                                        style: TextStyle(
                                          fontSize: 15,
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
                            padding:
                                EdgeInsets.only(top: 20, left: 5, bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.feedback,
                                      size: 22,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Give us feedback",
                                        style: TextStyle(
                                          fontSize: 15,
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
                        const Padding(
                          padding: EdgeInsets.only(top: 25, bottom: 10),
                          child: Text(
                            "Legal",
                            style: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.w900,
                              fontFamily: "Quicksand",
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding:
                                EdgeInsets.only(top: 20, left: 5, bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.miscellaneous_services,
                                      size: 21,
                                      weight: 1,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Terms of service",
                                        style: TextStyle(
                                          fontSize: 15,
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
                            padding:
                                EdgeInsets.only(top: 20, left: 5, bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.privacy_tip,
                                      size: 23,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Privacy Policy",
                                        style: TextStyle(
                                          fontSize: 15,
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
                        Container(
                          height: 1,
                          color: Colors.grey[200]!,
                        ),
                        InkWell(
                          onTap: () {
                            showCupertinoDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                  shadowColor: Colors.white,
                                  title: const Text(
                                    "Are you sure you want logout?",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text("NO")),
                                    TextButton(
                                        onPressed: () async {
                                          await _logOut();
                                          await Future.delayed(
                                              const Duration(seconds: 1));
                                          if (!context.mounted) return;
                                          Navigator.of(context).pop();
                                          setState(() {
                                            isLogin = false;
                                          });
                                        },
                                        child: const Text(
                                          "YES",
                                          style: TextStyle(color: Colors.red),
                                        )),
                                  ],
                                );
                              },
                            );
                          },
                          child: const Padding(
                            padding:
                                EdgeInsets.only(top: 20, left: 5, bottom: 20),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Text(
                                    "Logout",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Quicksand",
                                    ),
                                  ),
                                ],
                              ),
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
                            padding:
                                EdgeInsets.only(top: 20, left: 5, bottom: 20),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Text(
                                    "Version",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Quicksand",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 19, vertical: 10),
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)))),
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
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding:
                                EdgeInsets.only(top: 20, left: 5, bottom: 20),
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
                                          fontSize: 15,
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
                            padding:
                                EdgeInsets.only(top: 20, left: 5, bottom: 20),
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
                                          fontSize: 15,
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
                            padding:
                                EdgeInsets.only(top: 20, left: 5, bottom: 20),
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
                                          fontSize: 15,
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
                            padding:
                                EdgeInsets.only(top: 20, left: 5, bottom: 20),
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
                                          fontSize: 15,
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
                            padding:
                                EdgeInsets.only(top: 20, left: 5, bottom: 20),
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
                                          fontSize: 15,
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
