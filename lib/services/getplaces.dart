import 'dart:math';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:travel_app/connection/mongodb.dart';

class HomePlaces {
  static Future<List<Map<String, dynamic>>>? getPlaces(
      String filter, String country) async {
    try {
      final places = await MongoDatabase.allplaces
          .find(filter == "All"
              ? {"country": country}
              : {"category": filter, "country": country})
          .toList();
      return places;
    } catch (e) {
      print(e);
      return [];
    }
  }

  static Future<List<Map<String, dynamic>>>? getPlacesById(ObjectId id) async {
    try {
      final places = await MongoDatabase.allplaces.find({"_id": id}).toList();
      return places;
    } catch (e) {
      return [];
    }
  }
}
