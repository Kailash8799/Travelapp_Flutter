import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart' hide ConnectionState;
import 'package:travel_app/components/booking/Hotelcard.dart';
import 'package:travel_app/components/booking/Hotelcardskeleton.dart';
import 'package:travel_app/models/listing.dart';
import 'package:travel_app/realm/realm_services.dart';
import 'package:travel_app/realm/schemas.dart';

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
    final realmServices = Provider.of<RealmServices>(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          StreamBuilder<RealmResultsChanges<Listing>>(
            stream: realmServices.realm
                .query<Listing>("country=='$_country' SORT(_id ASC)")
                .changes,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SliverList.builder(
                  itemCount: _hotels.length,
                  itemBuilder: (context, index) {
                    return const Hotelcardskeleton();
                  },
                );
              } else {
                if (snapshot.hasData && snapshot.data != null) {
                  final results = snapshot.data!.results;
                  return SliverList.builder(
                    itemCount: results.realm.isClosed ? 0 : results.length,
                    itemBuilder: (context, index) {
                      return results[index].isValid
                          ? HotelCardcomp(
                              data: Listingmodel.fromJson(results[index]),
                            )
                          : const SizedBox(height: 0);
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
          )
        ],
      ),
    );
  }
}
