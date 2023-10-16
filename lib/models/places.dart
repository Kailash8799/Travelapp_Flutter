import 'dart:convert';

import 'package:realm/realm.dart';
import 'package:travel_app/realm/schemas.dart';

Placesmodel placesFromJson(String str) =>
    Placesmodel.fromJson(json.decode(str));

String placesToJson(Placesmodel data) => json.encode(data.toJson());

class Facility {
  final String icon;
  final String fac;

  Facility({
    required this.icon,
    required this.fac,
  });

  factory Facility.fromJson(PlaceFacilities json) => Facility(
        icon: json.icon as String,
        fac: json.fac as String,
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "fac": fac,
      };
}

class Placesmodel {
  final ObjectId id;
  final String title;
  final String description;
  final String location;
  final List<Facility> facilities;
  final List<String> imageSrc;
  final DateTime createdAt;
  final List<double> locationValue;
  final int price;
  final String country;
  final String rating;
  final String category;

  Placesmodel({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.facilities,
    required this.imageSrc,
    required this.createdAt,
    required this.locationValue,
    required this.price,
    required this.country,
    required this.rating,
    required this.category,
  });

  factory Placesmodel.fromJson(Place json) => Placesmodel(
        id: json.id,
        title: json.title,
        description: json.description as String,
        location: json.location,
        facilities: List<Facility>.from(
            json.facilities.map((x) => Facility.fromJson(x))),
        imageSrc: List<String>.from(json.imageSrc.map((x) => x)),
        createdAt: json.createdAt as DateTime,
        locationValue: List<double>.from(json.locationValue.map((x) => x)),
        price: json.price,
        country: json.country,
        rating: json.rating as String,
        category: json.category,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "description": description,
        "location": location,
        "facilities": List<dynamic>.from(facilities.map((x) => x.toJson())),
        "imageSrc": List<dynamic>.from(imageSrc.map((x) => x)),
        "createdAt": createdAt,
        "locationValue": List<dynamic>.from(locationValue.map((x) => x)),
        "price": price,
        "country": country,
        "rating": rating,
        "category": category,
      };
}
