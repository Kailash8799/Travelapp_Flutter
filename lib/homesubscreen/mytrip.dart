import 'package:flutter/material.dart';

class Mytrippage extends StatefulWidget {
  const Mytrippage({super.key});

  @override
  State<Mytrippage> createState() => _MytrippageState();
}

class _MytrippageState extends State<Mytrippage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Trip"),
      ),
    );
  }
}
