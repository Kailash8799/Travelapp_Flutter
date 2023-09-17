import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

Listing userFromJson(String str) => Listing.fromJson(json.decode(str));

String userToJson(Listing data) => json.encode(data.toJson());

class Facility {
  final String icon;
  final String fav;

  Facility({
    required this.icon,
    required this.fav,
  });

  factory Facility.fromJson(Map<String, dynamic> json) => Facility(
        icon: json["icon"],
        fav: json["fav"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "fav": fav,
      };
}

class Listing {
  final ObjectId id;
  final String title;
  final String hotelspecification;
  final String description;
  final List<String> imageSrc;
  final DateTime createdAt;
  final String category;
  final int roomCount;
  final int bathroomCount;
  final int guestCount;
  final List<double> locationValue;
  final ObjectId userId;
  final int price;
  final String country;
  final String placename;
  final String placenameCode;
  final List<Facility> facilities;
  final double rating;

  Listing({
    required this.id,
    required this.title,
    required this.hotelspecification,
    required this.description,
    required this.imageSrc,
    required this.createdAt,
    required this.category,
    required this.roomCount,
    required this.bathroomCount,
    required this.guestCount,
    required this.locationValue,
    required this.userId,
    required this.price,
    required this.country,
    required this.placename,
    required this.placenameCode,
    required this.facilities,
    required this.rating,
  });

  factory Listing.fromJson(Map<String, dynamic> json) => Listing(
        id: json["_id"],
        title: json["title"],
        hotelspecification: json["hotelspecification"],
        description: json["description"],
        imageSrc: List<String>.from(json["imageSrc"].map((x) => x)),
        createdAt: json["createdAt"],
        category: json["category"],
        roomCount: json["roomCount"],
        bathroomCount: json["bathroomCount"],
        guestCount: json["guestCount"],
        locationValue: List<double>.from(json["locationValue"].map((x) => x)),
        userId: json["userId"],
        price: json["price"],
        country: json["country"],
        facilities: List<Facility>.from(
            json["facilities"].map((x) => Facility.fromJson(x))),
        placename: json["placename"],
        placenameCode: json["placenameCode"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id.toJson(),
        "title": title,
        "hotelspecification": hotelspecification,
        "description": description,
        "imageSrc": List<dynamic>.from(imageSrc.map((x) => x)),
        "createdAt": createdAt,
        "category": category,
        "roomCount": roomCount,
        "bathroomCount": bathroomCount,
        "guestCount": guestCount,
        "locationValue": List<dynamic>.from(locationValue.map((x) => x)),
        "userId": userId.toJson(),
        "price": price,
        "country": country,
        "facilities": List<dynamic>.from(facilities.map((x) => x.toJson())),
        "placename": placename,
        "placenameCode": placenameCode,
        "rating": rating,
      };
}
