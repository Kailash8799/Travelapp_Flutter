import 'package:flutter/material.dart';

class FlightSerchPage extends StatefulWidget {
  const FlightSerchPage({super.key});

  @override
  State<FlightSerchPage> createState() => _FlightSerchPageState();
}

class _FlightSerchPageState extends State<FlightSerchPage> {
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search for flight",
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: BackButton(color: Theme.of(context).colorScheme.onPrimary),
      ),
    );
  }
}
