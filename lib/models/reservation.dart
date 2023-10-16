import 'dart:convert';
import 'package:realm/realm.dart';
import 'package:travel_app/realm/schemas.dart';

Reservationmodel placesFromJson(String str) =>
    Reservationmodel.fromJson(json.decode(str));

String placesToJson(Reservationmodel data) => json.encode(data.toJson());

class Reservationmodel {
  final ObjectId id;
  final DateTime createdAt;
  final String destinationname;
  final String email;
  final DateTime enddate;
  final ObjectId listingId;
  final String name;
  final DateTime startDate;
  final int totalprice;
  final String tripcoverimage;
  final DateTime tripenddate;
  final String tripname;
  final DateTime tripstartdate;
  final ObjectId ownerId;

  Reservationmodel({
    required this.id,
    required this.createdAt,
    required this.destinationname,
    required this.email,
    required this.enddate,
    required this.listingId,
    required this.name,
    required this.startDate,
    required this.totalprice,
    required this.tripcoverimage,
    required this.tripenddate,
    required this.tripname,
    required this.tripstartdate,
    required this.ownerId,
  });

  factory Reservationmodel.fromJson(AllReservations json) => Reservationmodel(
        id: json.id,
        createdAt: json.createdAt as DateTime,
        destinationname: json.destinationname as String,
        email: json.email as String,
        enddate: json.enddate,
        listingId: json.listingId,
        name: json.name as String,
        startDate: json.startDate,
        totalprice: json.totalprice,
        tripcoverimage: json.tripcoverimage as String,
        tripenddate: json.tripenddate as DateTime,
        tripname: json.tripname as String,
        tripstartdate: json.tripstartdate as DateTime,
        ownerId: json.ownerId,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "createdAt": createdAt,
        "destinationname": destinationname,
        "email": email,
        "enddate": enddate,
        "listingId": listingId,
        "name": name,
        "startDate": startDate,
        "totalprice": totalprice,
        "tripcoverimage": tripcoverimage,
        "tripenddate": tripenddate,
        "tripname": tripname,
        "tripstartdate": tripstartdate,
        "ownerId": ownerId,
      };
}
