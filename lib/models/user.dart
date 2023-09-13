import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  final ObjectId id;
  final String name;
  final String email;
  final String? password;
  final String? country;
  final String? phonenumber;
  final List<String>? booking;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.password,
    this.country,
    this.phonenumber,
    this.booking,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        country: json["country"],
        phonenumber: json["phonenumber"],
        booking: List<String>.from(json["booking"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "password": password,
        "country": country,
        "phonenumber": phonenumber,
        "booking": List<dynamic>.from(booking!.map((x) => x)),
      };
}
