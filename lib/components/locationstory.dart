import 'package:flutter/material.dart';

class Locationstorycomp extends StatelessWidget {
  const Locationstorycomp({super.key, required country, required image})
      : _country = country,
        _image = image;

  final String _image;
  final String _country;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: SizedBox(
          height: 90,
          width: 90,
          child: Column(children: [
            CircleAvatar(
              foregroundColor: Colors.pink,
              minRadius: 30,
              backgroundImage: NetworkImage(_image),
            ),
            Text(_country)
          ]),
        ),
      ),
    );
  }
}
