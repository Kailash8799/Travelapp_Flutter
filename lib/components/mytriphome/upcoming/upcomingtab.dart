import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart' hide ConnectionState;
import 'package:travel_app/components/booking/Hotelcardskeleton.dart';
import 'package:travel_app/components/mytriphome/hotelbooktrip/hotelbooktripcard.dart';
import 'package:travel_app/models/reservation.dart';
import 'package:travel_app/realm/realm_services.dart';
import 'package:travel_app/realm/schemas.dart';

class Upcomingtab extends StatefulWidget {
  const Upcomingtab({super.key});

  @override
  State<Upcomingtab> createState() => _UpcomingtabState();
}

class _UpcomingtabState extends State<Upcomingtab> {
  final List<int> _hotels = [1, 2, 3, 4, 5, 6, 7, 8];
  @override
  Widget build(BuildContext context) {
    final realmServices = Provider.of<RealmServices>(context);
    return StreamBuilder<RealmResultsChanges<AllReservations>>(
      stream: realmServices.realm
          .query<AllReservations>(r'owner_id == $0 AND enddate >= $1', [
        ObjectId.fromHexString(realmServices.currentUser!.id),
        DateTime.now().subtract(const Duration(days: 0))
      ]).changes,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SliverList.builder(
            itemCount: _hotels.length,
            itemBuilder: (context, index) {
              return const Hotelcardskeleton();
            },
          );
        } else {
          if (snapshot.hasData &&
              snapshot.data != null &&
              snapshot.data!.results.isNotEmpty) {
            final results = snapshot.data!.results;
            return SliverList.builder(
              itemCount: results.realm.isClosed ? 0 : results.length,
              itemBuilder: (context, index) {
                return results[index].isValid
                    ? Hotelbooktripcard(
                        data: Reservationmodel.fromJson(results[index]))
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
                        "No trips found",
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
    );
  }
}
