import 'package:flutter/material.dart';
import 'package:travel_app/components/booking/Hotelcard.dart';

class Hotelbookingplace extends StatefulWidget {
  const Hotelbookingplace({super.key});

  @override
  State<Hotelbookingplace> createState() => _HotelbookingplaceState();
}

class _HotelbookingplaceState extends State<Hotelbookingplace> {
  final List<int> _hotels = [1, 2, 3, 4, 5, 6, 7, 8];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _hotels.length,
        itemBuilder: (context, index) {
          return HotelCardcomp(
            doublebed: 2,
            hotelImage:
                "https://images.oyoroomscdn.com/uploads/hotel_image/17536/large/1628521e0b5dd874.jpg",
            hotelname: "Parivar Hotel",
            hotelrent: 200,
            hotelspecification: "Double room with bed",
            isAc: true,
            isBath: true,
            tag: "imagecard$index",
            hotelstar: 3,
            likedper: 96,
          );
        },
      ),
    );
  }
}
