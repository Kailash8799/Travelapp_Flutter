import 'package:flutter/material.dart';

class OnboardingCard extends StatefulWidget {
  const OnboardingCard({super.key, image}) : _image = image;
  final String _image;

  @override
  State<OnboardingCard> createState() => _OnboardingCardState();
}

class _OnboardingCardState extends State<OnboardingCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 80),
          child: Image.asset("assets/images/${widget._image}"),
        ),
        const Text(
          "Instruction 1",
          style: TextStyle(fontSize: 20),
        ),
        const Text("Lorem"),
        const Text("Lorem full text"),
        const Text("Lorem"),
      ],
    );
  }
}
