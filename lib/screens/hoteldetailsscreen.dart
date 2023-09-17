import 'package:flutter/material.dart';

class Hoteldetailscreen extends StatefulWidget {
  const Hoteldetailscreen({super.key});

  @override
  State<Hoteldetailscreen> createState() => _HoteldetailscreenState();
}

class _HoteldetailscreenState extends State<Hoteldetailscreen> {
  @override
  Widget build(BuildContext context) {
    dynamic data = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      body: GestureDetector(
        child: Hero(
          tag: data.id,
          child: Image.network(
            data.imageSrc[0],
          ),
        ),
      ),
    );
  }
}
