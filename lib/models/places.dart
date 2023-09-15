import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

Places placesFromJson(String str) => Places.fromJson(json.decode(str));

String placesToJson(Places data) => json.encode(data.toJson());

class Facility {
  final String icon;
  final String fac;

  Facility({
    required this.icon,
    required this.fac,
  });

  factory Facility.fromJson(Map<String, dynamic> json) => Facility(
        icon: json["icon"],
        fac: json["fac"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "fac": fac,
      };
}

class Places {
  final ObjectId id;
  final String title;
  final String description;
  final String location;
  final List<Facility> facilities;
  final List<String> imageSrc;
  final DateTime createdAt;
  final String locationValue;
  final int price;
  final String country;
  final String rating;
  final String category;

  Places({
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

  factory Places.fromJson(Map<String, dynamic> json) => Places(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        location: json["location"],
        facilities: List<Facility>.from(
            json["facilities"].map((x) => Facility.fromJson(x))),
        imageSrc: List<String>.from(json["imageSrc"].map((x) => x)),
        createdAt: json["createdAt"],
        locationValue: json["locationValue"],
        price: json["price"],
        country: json["country"],
        rating: json["rating"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id.toJson(),
        "title": title,
        "description": description,
        "location": location,
        "facilities": List<dynamic>.from(facilities.map((x) => x.toJson())),
        "imageSrc": List<dynamic>.from(imageSrc.map((x) => x)),
        "createdAt": createdAt,
        "locationValue": locationValue,
        "price": price,
        "country": country,
        "rating": rating,
        "category": category,
      };
}
