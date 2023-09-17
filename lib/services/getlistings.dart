import 'package:mongo_dart/mongo_dart.dart';
import 'package:travel_app/connection/mongodb.dart';

class Hotels {
  static Future<List<Map<String, dynamic>>>? getHotels({
    required String country,
    String? placenameCode,
    int roomCount = 0,
    int guestCount = 0,
    int price = 0,
  }) async {
    try {
      final hotels = await MongoDatabase.allHotels
          .find(placenameCode != null
              ? where
                  .gte("price", price)
                  .gte("guestCount", guestCount)
                  .gte("roomCount", roomCount)
                  .eq("country", country)
                  .eq("placenameCode", placenameCode)
              : where
                  .gte("price", price)
                  .gte("guestCount", guestCount)
                  .gte("roomCount", roomCount)
                  .eq("country", country))
          .toList();
      return hotels;
    } catch (e) {
      print(e);
      return [];
    }
  }

  static Future<List<Map<String, dynamic>>>? getHotelById(ObjectId id) async {
    try {
      final hotel = await MongoDatabase.allHotels.find({"_id": id}).toList();
      return hotel;
    } catch (e) {
      return [];
    }
  }
}
