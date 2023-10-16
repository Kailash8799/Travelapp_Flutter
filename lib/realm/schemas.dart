import 'package:realm/realm.dart';
part 'schemas.g.dart';

@RealmModel()
@MapTo('listing')
class _Listing {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;

  int? bathroomCount;

  late String category;

  late String country;

  DateTime? createdAt;

  String? description;

  late List<_ListingFacilities> facilities;

  int? guestCount;

  String? hotelspecification;

  late List<String> imageSrc;

  late List<double> locationValue;

  late String placename;

  String? placenameCode;

  late int price;

  double? rating;

  int? roomCount;

  late String title;

  ObjectId? userId;
}

@RealmModel(ObjectType.embeddedObject)
@MapTo('listing_facilities')
class _ListingFacilities {
  String? fav;

  String? icon;
}

@RealmModel()
@MapTo('place')
class _Place {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  late String category;
  late String country;
  DateTime? createdAt;
  String? description;
  late List<_PlaceFacilities> facilities;
  late List<String> imageSrc;
  late String location;
  late List<double> locationValue;
  late int price;
  String? rating;
  late String title;
}

@RealmModel(ObjectType.embeddedObject)
@MapTo('place_facilities')
class _PlaceFacilities {
  String? fac;

  String? icon;
}

@RealmModel()
@MapTo('userdata')
class _Userdata {
  @PrimaryKey()
  @MapTo('_id')
  ObjectId? id;

  @MapTo('owner_id')
  late String ownerId;

  String? country;

  DateTime? createdAt;

  late String email;

  bool? emailVerified;

  String? name;

  late String password;

  String? phonenumber;

  DateTime? updatedAt;

  // List<_Reservations> reservations = [];
}

// @RealmModel(ObjectType.embeddedObject)
// @MapTo('reservation')
// class _Reservations {
//   DateTime? createdAt;
//   DateTime? enddate;
//   ObjectId? listingId;
//   ObjectId? reservationId;
//   DateTime? startDate;
//   int? totalprice;
//   ObjectId? userId;
// }

// _AllReservations
// @RealmModel()
// @MapTo('allreservation')
// class _AllReservations {
//   @PrimaryKey()
//   @MapTo('_id')
//   late ObjectId id;
//   DateTime? createdAt;
//   late DateTime enddate;
//   late ObjectId listingId;
//   late DateTime startDate;
//   late int totalprice;
//   @MapTo('owner_id')
//   late ObjectId ownerId;
//   String? tripcoverimage;
//   DateTime? tripenddate;
//   String? tripname;
//   DateTime? tripstartdate;
//   String? name;
//   String? email;
//   String? destinationname;
// }

@RealmModel()
@MapTo('allreservation')
class _AllReservations {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  DateTime? createdAt;
  String? destinationname;
  String? email;
  late DateTime enddate;
  late ObjectId listingId;
  String? name;
  @MapTo('owner_id')
  late ObjectId ownerId;
  late DateTime startDate;
  late int totalprice;
  String? tripcoverimage;
  DateTime? tripenddate;
  String? tripname;
  DateTime? tripstartdate;
}

// {
//   "title": "userdata",
//   "type": "object",
//   "required": [
//     "email",
//     "owner_id",
//     "password"
//   ],
//   "properties": {
//     "_id": {
//       "bsonType": "objectId"
//     },
//     "country": {
//       "bsonType": "string"
//     },
//     "createdAt": {
//       "bsonType": "date"
//     },
//     "email": {
//       "bsonType": "string"
//     },
//     "emailVerified": {
//       "bsonType": "bool"
//     },
//     "name": {
//       "bsonType": "string"
//     },
//     "owner_id": {
//       "bsonType": "string"
//     },
//     "password": {
//       "bsonType": "string"
//     },
//     "phonenumber": {
//       "bsonType": "string"
//     },
//     "updatedAt": {
//       "bsonType": "date"
//     }
//   }
// }
