import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

Listing userFromJson(String str) => Listing.fromJson(json.decode(str));

String userToJson(Listing data) => json.encode(data.toJson());

class Listing {
  final ObjectId id;
  final String title;
  final String description;
  final List<String> imageSrc;
  final DateTime createdAt;
  final String category;
  final int roomCount;
  final int bathroomCount;
  final int guestCount;
  final String locationValue;
  final ObjectId userId;
  final int price;
  final String country;

  Listing({
    required this.id,
    required this.title,
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
  });

  factory Listing.fromJson(Map<String, dynamic> json) => Listing(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        imageSrc: List<String>.from(json["imageSrc"].map((x) => x)),
        createdAt: json["createdAt"],
        category: json["category"],
        roomCount: json["roomCount"],
        bathroomCount: json["bathroomCount"],
        guestCount: json["guestCount"],
        locationValue: json["locationValue"],
        userId: json["userId"],
        price: json["price"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id.toJson(),
        "title": title,
        "description": description,
        "imageSrc": List<dynamic>.from(imageSrc.map((x) => x)),
        "createdAt": createdAt,
        "category": category,
        "roomCount": roomCount,
        "bathroomCount": bathroomCount,
        "guestCount": guestCount,
        "locationValue": locationValue,
        "userId": userId.toJson(),
        "price": price,
        "country": country,
      };
}
