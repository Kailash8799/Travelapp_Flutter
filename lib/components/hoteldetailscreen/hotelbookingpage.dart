import 'package:flutter/material.dart';
import 'package:travel_app/components/hoteldetailscreen/bookingformpage.dart';
import 'package:travel_app/models/listing.dart';
import 'package:travel_app/services/getlistings.dart';

class Hotelconfirmbook extends StatelessWidget {
  const Hotelconfirmbook({super.key, id}) : _id = id;

  final dynamic _id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        leading: BackButton(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        title: Text(
          "Confirm Booking",
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: FutureBuilder(
            future: Hotels.getHotelById(_id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Column(
                  children: [
                    Card(
                      elevation: 1,
                      surfaceTintColor: Colors.transparent,
                      color: Theme.of(context).colorScheme.background,
                      shadowColor: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(0.3),
                      child: Container(
                        height: 300,
                      ),
                    )
                  ],
                );
              } else {
                if (snapshot.hasData && snapshot.data!.length == 1) {
                  return Hotelbookformpage(
                      data: Listing.fromJson(snapshot.data![0]));
                } else {
                  return Column(
                    children: [
                      Card(
                        child: Container(
                          height: 300,
                        ),
                      )
                    ],
                  );
                }
              }
            }),
      )),
    );
  }
}
