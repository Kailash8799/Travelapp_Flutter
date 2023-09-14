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
      return [];
    }
  }
}
