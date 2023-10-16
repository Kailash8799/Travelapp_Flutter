import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart' hide ConnectionState;
import 'package:travel_app/components/hoteldetailscreen/bookingformpage.dart';
import 'package:travel_app/models/listing.dart';
import 'package:travel_app/realm/realm_services.dart';
import 'package:travel_app/realm/schemas.dart';

class Hotelconfirmbook extends StatefulWidget {
  const Hotelconfirmbook({super.key, required id, required bookingrange})
      : _id = id,
        _bookingrange = bookingrange;

  final ObjectId _id;
  final DateTimeRange _bookingrange;

  @override
  State<Hotelconfirmbook> createState() => _HotelconfirmbookState();
}

class _HotelconfirmbookState extends State<Hotelconfirmbook> {
  @override
  Widget build(BuildContext context) {
    final realmServices = Provider.of<RealmServices>(context);
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
        child: StreamBuilder<RealmResultsChanges<Listing>>(
            stream: realmServices.realm
                .query<Listing>(r'_id == $0', [widget._id]).changes,
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
                if (snapshot.hasData &&
                    snapshot.data != null &&
                    snapshot.data!.results.isNotEmpty) {
                  final results = snapshot.data!.results;
                  return Hotelbookformpage(
                    data: Listingmodel.fromJson(results[0]),
                    bookingrange: widget._bookingrange,
                  );
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
