import 'package:flutter/material.dart';
import 'package:travel_app/components/booking/Hotelcard.dart';
import 'package:travel_app/components/booking/Hotelcardskeleton.dart';
import 'package:travel_app/models/listing.dart';
import 'package:travel_app/services/getlistings.dart';

class Hotelbookingplace extends StatefulWidget {
  const Hotelbookingplace({super.key});

  @override
  State<Hotelbookingplace> createState() => _HotelbookingplaceState();
}

class _HotelbookingplaceState extends State<Hotelbookingplace> {
  final List<int> _hotels = [1, 2, 3, 4, 5, 6, 7, 8];
  final String _country = "IND";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          FutureBuilder(
            future: Hotels.getHotels(country: _country),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SliverList.builder(
                  itemCount: _hotels.length,
                  itemBuilder: (context, index) {
                    return const Hotelcardskeleton();
                  },
                );
              } else {
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return SliverList.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return HotelCardcomp(
                        data: Listing.fromJson(snapshot.data![index]),
                      );
                    },
                  );
                } else {
                  return SliverToBoxAdapter(
                    child: SizedBox(
                      height: 500,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "No hotels found",
                              style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
