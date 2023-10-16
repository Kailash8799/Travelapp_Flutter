import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/components/widget/snakbar.dart';
import 'package:travel_app/screens/homescreen.dart';
import 'package:travel_app/realm/app_services.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _name = TextEditingController();
  static bool _isPasswordhidden = true;
  static bool _loadingSignup = false;

  void _createAccount() async {
    final appServices = Provider.of<AppServices>(context, listen: false);
    if (_formKey.currentState!.validate()) {
      setState(() {
        _loadingSignup = true;
      });
      String name = _name.text;
      String email = _email.text;
      String password = _password.text;
      try {
        Map<String, dynamic> userCreated = await appServices
            .registerUserEmailPassword(email, password, name, context);
        if (userCreated["success"]) {
          await Future.delayed(const Duration(seconds: 1));
          if (!context.mounted) return;
          showSnakbar(context, userCreated["message"]);
          setState(() {
            _loadingSignup = false;
          });
          Navigator.of(context).pop();
        } else {
          setState(() {
            _loadingSignup = false;
          });
          Future.delayed(const Duration(seconds: 1));
          if (!context.mounted) return;
          showSnakbar(context, userCreated["message"]);
        }
      } catch (e) {
        showSnakbar(context, "Some error occurred!");
        setState(() {
          _loadingSignup = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        toolbarHeight: 0,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Create new account",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                        builder: (context) {
                          return const HomeScreen();
                        },
                      ), (route) => false);
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.orange,
                      ),
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 6, top: 10),
                        child: Text("Name"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: TextFormField(
                          controller: _name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter your name";
                            } else if (value.length < 3) {
                              return "Enter minimun 3 character name";
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 16),
                            hintText: "Your name",
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.red,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.red,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(
                            color: Colors.grey[700]!,
                            fontSize: 15,
                            height: 1,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 6, top: 25),
                        child: Text("Email"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 6) {
                              return "Invalid email";
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          controller: _email,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 16),
                            hintText: "example@gmail.com",
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.red,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.red,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          style: TextStyle(
                              color: Colors.grey[700]!,
                              fontSize: 15,
                              height: 1),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 6, top: 25),
                        child: Text("Password"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter password";
                            } else if (value.length < 7) {
                              return "Enter minimun 7 character";
                            } else {
                              return null;
                            }
                          },
                          controller: _password,
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                setState(() {
                                  _isPasswordhidden = !_isPasswordhidden;
                                });
                              },
                              child: Icon(_isPasswordhidden
                                  ? Icons.remove_red_eye
                                  : Icons.remove_red_eye_outlined),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 16),
                            hintText: "••••••••••",
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.red,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.red,
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          textAlignVertical: TextAlignVertical.center,
                          obscureText: _isPasswordhidden,
                          obscuringCharacter: "•",
                          style: TextStyle(
                            color: Colors.grey[700]!,
                            fontSize: 15,
                            height: 1,
                          ),
                        ),
                      ),
                      !_loadingSignup
                          ? Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: ElevatedButton(
                                onPressed: _createAccount,
                                style: ElevatedButton.styleFrom(
                                    minimumSize: const Size.fromHeight(50),
                                    backgroundColor: Colors.orange),
                                child: const Text(
                                  "Sign up",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    minimumSize: const Size.fromHeight(50),
                                    backgroundColor: Colors.orange),
                                child: const CupertinoActivityIndicator(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                      const Padding(
                        padding: EdgeInsets.only(top: 35),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("OR"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 3),
                                child: ShaderMask(
                                  shaderCallback: (Rect bounds) {
                                    return const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.red,
                                        Colors.orange,
                                        Colors.green
                                      ],
                                    ).createShader(bounds);
                                  },
                                  child: const FaIcon(
                                    FontAwesomeIcons.google,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 14),
                                child: FaIcon(
                                  FontAwesomeIcons.facebook,
                                  color: Colors.blue,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3),
                                child: FaIcon(
                                  FontAwesomeIcons.apple,
                                  size: 27,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Already have an account?",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(100),
                            ),
                          ),
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(50),
                            ),
                            child: const Text(
                              "Sign in",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 19,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          )
        ])),
      ),
    );
  }
}
