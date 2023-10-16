// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schemas.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Listing extends _Listing with RealmEntity, RealmObjectBase, RealmObject {
  Listing(
    ObjectId id,
    String category,
    String country,
    String placename,
    int price,
    String title, {
    int? bathroomCount,
    DateTime? createdAt,
    String? description,
    int? guestCount,
    String? hotelspecification,
    String? placenameCode,
    double? rating,
    int? roomCount,
    ObjectId? userId,
    Iterable<ListingFacilities> facilities = const [],
    Iterable<String> imageSrc = const [],
    Iterable<double> locationValue = const [],
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'bathroomCount', bathroomCount);
    RealmObjectBase.set(this, 'category', category);
    RealmObjectBase.set(this, 'country', country);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set(this, 'guestCount', guestCount);
    RealmObjectBase.set(this, 'hotelspecification', hotelspecification);
    RealmObjectBase.set(this, 'placename', placename);
    RealmObjectBase.set(this, 'placenameCode', placenameCode);
    RealmObjectBase.set(this, 'price', price);
    RealmObjectBase.set(this, 'rating', rating);
    RealmObjectBase.set(this, 'roomCount', roomCount);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'userId', userId);
    RealmObjectBase.set<RealmList<ListingFacilities>>(
        this, 'facilities', RealmList<ListingFacilities>(facilities));
    RealmObjectBase.set<RealmList<String>>(
        this, 'imageSrc', RealmList<String>(imageSrc));
    RealmObjectBase.set<RealmList<double>>(
        this, 'locationValue', RealmList<double>(locationValue));
  }

  Listing._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  int? get bathroomCount =>
      RealmObjectBase.get<int>(this, 'bathroomCount') as int?;
  @override
  set bathroomCount(int? value) =>
      RealmObjectBase.set(this, 'bathroomCount', value);

  @override
  String get category =>
      RealmObjectBase.get<String>(this, 'category') as String;
  @override
  set category(String value) => RealmObjectBase.set(this, 'category', value);

  @override
  String get country => RealmObjectBase.get<String>(this, 'country') as String;
  @override
  set country(String value) => RealmObjectBase.set(this, 'country', value);

  @override
  DateTime? get createdAt =>
      RealmObjectBase.get<DateTime>(this, 'createdAt') as DateTime?;
  @override
  set createdAt(DateTime? value) =>
      RealmObjectBase.set(this, 'createdAt', value);

  @override
  String? get description =>
      RealmObjectBase.get<String>(this, 'description') as String?;
  @override
  set description(String? value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  RealmList<ListingFacilities> get facilities =>
      RealmObjectBase.get<ListingFacilities>(this, 'facilities')
          as RealmList<ListingFacilities>;
  @override
  set facilities(covariant RealmList<ListingFacilities> value) =>
      throw RealmUnsupportedSetError();

  @override
  int? get guestCount => RealmObjectBase.get<int>(this, 'guestCount') as int?;
  @override
  set guestCount(int? value) => RealmObjectBase.set(this, 'guestCount', value);

  @override
  String? get hotelspecification =>
      RealmObjectBase.get<String>(this, 'hotelspecification') as String?;
  @override
  set hotelspecification(String? value) =>
      RealmObjectBase.set(this, 'hotelspecification', value);

  @override
  RealmList<String> get imageSrc =>
      RealmObjectBase.get<String>(this, 'imageSrc') as RealmList<String>;
  @override
  set imageSrc(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmList<double> get locationValue =>
      RealmObjectBase.get<double>(this, 'locationValue') as RealmList<double>;
  @override
  set locationValue(covariant RealmList<double> value) =>
      throw RealmUnsupportedSetError();

  @override
  String get placename =>
      RealmObjectBase.get<String>(this, 'placename') as String;
  @override
  set placename(String value) => RealmObjectBase.set(this, 'placename', value);

  @override
  String? get placenameCode =>
      RealmObjectBase.get<String>(this, 'placenameCode') as String?;
  @override
  set placenameCode(String? value) =>
      RealmObjectBase.set(this, 'placenameCode', value);

  @override
  int get price => RealmObjectBase.get<int>(this, 'price') as int;
  @override
  set price(int value) => RealmObjectBase.set(this, 'price', value);

  @override
  double? get rating => RealmObjectBase.get<double>(this, 'rating') as double?;
  @override
  set rating(double? value) => RealmObjectBase.set(this, 'rating', value);

  @override
  int? get roomCount => RealmObjectBase.get<int>(this, 'roomCount') as int?;
  @override
  set roomCount(int? value) => RealmObjectBase.set(this, 'roomCount', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  ObjectId? get userId =>
      RealmObjectBase.get<ObjectId>(this, 'userId') as ObjectId?;
  @override
  set userId(ObjectId? value) => RealmObjectBase.set(this, 'userId', value);

  @override
  Stream<RealmObjectChanges<Listing>> get changes =>
      RealmObjectBase.getChanges<Listing>(this);

  @override
  Listing freeze() => RealmObjectBase.freezeObject<Listing>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Listing._);
    return const SchemaObject(ObjectType.realmObject, Listing, 'listing', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('bathroomCount', RealmPropertyType.int, optional: true),
      SchemaProperty('category', RealmPropertyType.string),
      SchemaProperty('country', RealmPropertyType.string),
      SchemaProperty('createdAt', RealmPropertyType.timestamp, optional: true),
      SchemaProperty('description', RealmPropertyType.string, optional: true),
      SchemaProperty('facilities', RealmPropertyType.object,
          linkTarget: 'listing_facilities',
          collectionType: RealmCollectionType.list),
      SchemaProperty('guestCount', RealmPropertyType.int, optional: true),
      SchemaProperty('hotelspecification', RealmPropertyType.string,
          optional: true),
      SchemaProperty('imageSrc', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('locationValue', RealmPropertyType.double,
          collectionType: RealmCollectionType.list),
      SchemaProperty('placename', RealmPropertyType.string),
      SchemaProperty('placenameCode', RealmPropertyType.string, optional: true),
      SchemaProperty('price', RealmPropertyType.int),
      SchemaProperty('rating', RealmPropertyType.double, optional: true),
      SchemaProperty('roomCount', RealmPropertyType.int, optional: true),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('userId', RealmPropertyType.objectid, optional: true),
    ]);
  }
}

class ListingFacilities extends _ListingFacilities
    with RealmEntity, RealmObjectBase, EmbeddedObject {
  ListingFacilities({
    String? fav,
    String? icon,
  }) {
    RealmObjectBase.set(this, 'fav', fav);
    RealmObjectBase.set(this, 'icon', icon);
  }

  ListingFacilities._();

  @override
  String? get fav => RealmObjectBase.get<String>(this, 'fav') as String?;
  @override
  set fav(String? value) => RealmObjectBase.set(this, 'fav', value);

  @override
  String? get icon => RealmObjectBase.get<String>(this, 'icon') as String?;
  @override
  set icon(String? value) => RealmObjectBase.set(this, 'icon', value);

  @override
  Stream<RealmObjectChanges<ListingFacilities>> get changes =>
      RealmObjectBase.getChanges<ListingFacilities>(this);

  @override
  ListingFacilities freeze() =>
      RealmObjectBase.freezeObject<ListingFacilities>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(ListingFacilities._);
    return const SchemaObject(
        ObjectType.embeddedObject, ListingFacilities, 'listing_facilities', [
      SchemaProperty('fav', RealmPropertyType.string, optional: true),
      SchemaProperty('icon', RealmPropertyType.string, optional: true),
    ]);
  }
}

class Place extends _Place with RealmEntity, RealmObjectBase, RealmObject {
  Place(
    ObjectId id,
    String category,
    String country,
    String location,
    int price,
    String title, {
    DateTime? createdAt,
    String? description,
    String? rating,
    Iterable<PlaceFacilities> facilities = const [],
    Iterable<String> imageSrc = const [],
    Iterable<double> locationValue = const [],
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'category', category);
    RealmObjectBase.set(this, 'country', country);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set(this, 'location', location);
    RealmObjectBase.set(this, 'price', price);
    RealmObjectBase.set(this, 'rating', rating);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set<RealmList<PlaceFacilities>>(
        this, 'facilities', RealmList<PlaceFacilities>(facilities));
    RealmObjectBase.set<RealmList<String>>(
        this, 'imageSrc', RealmList<String>(imageSrc));
    RealmObjectBase.set<RealmList<double>>(
        this, 'locationValue', RealmList<double>(locationValue));
  }

  Place._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get category =>
      RealmObjectBase.get<String>(this, 'category') as String;
  @override
  set category(String value) => RealmObjectBase.set(this, 'category', value);

  @override
  String get country => RealmObjectBase.get<String>(this, 'country') as String;
  @override
  set country(String value) => RealmObjectBase.set(this, 'country', value);

  @override
  DateTime? get createdAt =>
      RealmObjectBase.get<DateTime>(this, 'createdAt') as DateTime?;
  @override
  set createdAt(DateTime? value) =>
      RealmObjectBase.set(this, 'createdAt', value);

  @override
  String? get description =>
      RealmObjectBase.get<String>(this, 'description') as String?;
  @override
  set description(String? value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  RealmList<PlaceFacilities> get facilities =>
      RealmObjectBase.get<PlaceFacilities>(this, 'facilities')
          as RealmList<PlaceFacilities>;
  @override
  set facilities(covariant RealmList<PlaceFacilities> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmList<String> get imageSrc =>
      RealmObjectBase.get<String>(this, 'imageSrc') as RealmList<String>;
  @override
  set imageSrc(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  String get location =>
      RealmObjectBase.get<String>(this, 'location') as String;
  @override
  set location(String value) => RealmObjectBase.set(this, 'location', value);

  @override
  RealmList<double> get locationValue =>
      RealmObjectBase.get<double>(this, 'locationValue') as RealmList<double>;
  @override
  set locationValue(covariant RealmList<double> value) =>
      throw RealmUnsupportedSetError();

  @override
  int get price => RealmObjectBase.get<int>(this, 'price') as int;
  @override
  set price(int value) => RealmObjectBase.set(this, 'price', value);

  @override
  String? get rating => RealmObjectBase.get<String>(this, 'rating') as String?;
  @override
  set rating(String? value) => RealmObjectBase.set(this, 'rating', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  Stream<RealmObjectChanges<Place>> get changes =>
      RealmObjectBase.getChanges<Place>(this);

  @override
  Place freeze() => RealmObjectBase.freezeObject<Place>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Place._);
    return const SchemaObject(ObjectType.realmObject, Place, 'place', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('category', RealmPropertyType.string),
      SchemaProperty('country', RealmPropertyType.string),
      SchemaProperty('createdAt', RealmPropertyType.timestamp, optional: true),
      SchemaProperty('description', RealmPropertyType.string, optional: true),
      SchemaProperty('facilities', RealmPropertyType.object,
          linkTarget: 'place_facilities',
          collectionType: RealmCollectionType.list),
      SchemaProperty('imageSrc', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('location', RealmPropertyType.string),
      SchemaProperty('locationValue', RealmPropertyType.double,
          collectionType: RealmCollectionType.list),
      SchemaProperty('price', RealmPropertyType.int),
      SchemaProperty('rating', RealmPropertyType.string, optional: true),
      SchemaProperty('title', RealmPropertyType.string),
    ]);
  }
}

class PlaceFacilities extends _PlaceFacilities
    with RealmEntity, RealmObjectBase, EmbeddedObject {
  PlaceFacilities({
    String? fac,
    String? icon,
  }) {
    RealmObjectBase.set(this, 'fac', fac);
    RealmObjectBase.set(this, 'icon', icon);
  }

  PlaceFacilities._();

  @override
  String? get fac => RealmObjectBase.get<String>(this, 'fac') as String?;
  @override
  set fac(String? value) => RealmObjectBase.set(this, 'fac', value);

  @override
  String? get icon => RealmObjectBase.get<String>(this, 'icon') as String?;
  @override
  set icon(String? value) => RealmObjectBase.set(this, 'icon', value);

  @override
  Stream<RealmObjectChanges<PlaceFacilities>> get changes =>
      RealmObjectBase.getChanges<PlaceFacilities>(this);

  @override
  PlaceFacilities freeze() =>
      RealmObjectBase.freezeObject<PlaceFacilities>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(PlaceFacilities._);
    return const SchemaObject(
        ObjectType.embeddedObject, PlaceFacilities, 'place_facilities', [
      SchemaProperty('fac', RealmPropertyType.string, optional: true),
      SchemaProperty('icon', RealmPropertyType.string, optional: true),
    ]);
  }
}

class Userdata extends _Userdata
    with RealmEntity, RealmObjectBase, RealmObject {
  Userdata(
    ObjectId? id,
    String ownerId,
    String email,
    String password, {
    String? country,
    DateTime? createdAt,
    bool? emailVerified,
    String? name,
    String? phonenumber,
    DateTime? updatedAt,
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'owner_id', ownerId);
    RealmObjectBase.set(this, 'country', country);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set(this, 'email', email);
    RealmObjectBase.set(this, 'emailVerified', emailVerified);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'password', password);
    RealmObjectBase.set(this, 'phonenumber', phonenumber);
    RealmObjectBase.set(this, 'updatedAt', updatedAt);
  }

  Userdata._();

  @override
  ObjectId? get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId?;
  @override
  set id(ObjectId? value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get ownerId => RealmObjectBase.get<String>(this, 'owner_id') as String;
  @override
  set ownerId(String value) => RealmObjectBase.set(this, 'owner_id', value);

  @override
  String? get country =>
      RealmObjectBase.get<String>(this, 'country') as String?;
  @override
  set country(String? value) => RealmObjectBase.set(this, 'country', value);

  @override
  DateTime? get createdAt =>
      RealmObjectBase.get<DateTime>(this, 'createdAt') as DateTime?;
  @override
  set createdAt(DateTime? value) =>
      RealmObjectBase.set(this, 'createdAt', value);

  @override
  String get email => RealmObjectBase.get<String>(this, 'email') as String;
  @override
  set email(String value) => RealmObjectBase.set(this, 'email', value);

  @override
  bool? get emailVerified =>
      RealmObjectBase.get<bool>(this, 'emailVerified') as bool?;
  @override
  set emailVerified(bool? value) =>
      RealmObjectBase.set(this, 'emailVerified', value);

  @override
  String? get name => RealmObjectBase.get<String>(this, 'name') as String?;
  @override
  set name(String? value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get password =>
      RealmObjectBase.get<String>(this, 'password') as String;
  @override
  set password(String value) => RealmObjectBase.set(this, 'password', value);

  @override
  String? get phonenumber =>
      RealmObjectBase.get<String>(this, 'phonenumber') as String?;
  @override
  set phonenumber(String? value) =>
      RealmObjectBase.set(this, 'phonenumber', value);

  @override
  DateTime? get updatedAt =>
      RealmObjectBase.get<DateTime>(this, 'updatedAt') as DateTime?;
  @override
  set updatedAt(DateTime? value) =>
      RealmObjectBase.set(this, 'updatedAt', value);

  @override
  Stream<RealmObjectChanges<Userdata>> get changes =>
      RealmObjectBase.getChanges<Userdata>(this);

  @override
  Userdata freeze() => RealmObjectBase.freezeObject<Userdata>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Userdata._);
    return const SchemaObject(ObjectType.realmObject, Userdata, 'userdata', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', optional: true, primaryKey: true),
      SchemaProperty('ownerId', RealmPropertyType.string, mapTo: 'owner_id'),
      SchemaProperty('country', RealmPropertyType.string, optional: true),
      SchemaProperty('createdAt', RealmPropertyType.timestamp, optional: true),
      SchemaProperty('email', RealmPropertyType.string),
      SchemaProperty('emailVerified', RealmPropertyType.bool, optional: true),
      SchemaProperty('name', RealmPropertyType.string, optional: true),
      SchemaProperty('password', RealmPropertyType.string),
      SchemaProperty('phonenumber', RealmPropertyType.string, optional: true),
      SchemaProperty('updatedAt', RealmPropertyType.timestamp, optional: true),
    ]);
  }
}

class AllReservations extends _AllReservations
    with RealmEntity, RealmObjectBase, RealmObject {
  AllReservations(
    ObjectId id,
    DateTime enddate,
    ObjectId listingId,
    ObjectId ownerId,
    DateTime startDate,
    int totalprice, {
    DateTime? createdAt,
    String? destinationname,
    String? email,
    String? name,
    String? tripcoverimage,
    DateTime? tripenddate,
    String? tripname,
    DateTime? tripstartdate,
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set(this, 'destinationname', destinationname);
    RealmObjectBase.set(this, 'email', email);
    RealmObjectBase.set(this, 'enddate', enddate);
    RealmObjectBase.set(this, 'listingId', listingId);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'owner_id', ownerId);
    RealmObjectBase.set(this, 'startDate', startDate);
    RealmObjectBase.set(this, 'totalprice', totalprice);
    RealmObjectBase.set(this, 'tripcoverimage', tripcoverimage);
    RealmObjectBase.set(this, 'tripenddate', tripenddate);
    RealmObjectBase.set(this, 'tripname', tripname);
    RealmObjectBase.set(this, 'tripstartdate', tripstartdate);
  }

  AllReservations._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  DateTime? get createdAt =>
      RealmObjectBase.get<DateTime>(this, 'createdAt') as DateTime?;
  @override
  set createdAt(DateTime? value) =>
      RealmObjectBase.set(this, 'createdAt', value);

  @override
  String? get destinationname =>
      RealmObjectBase.get<String>(this, 'destinationname') as String?;
  @override
  set destinationname(String? value) =>
      RealmObjectBase.set(this, 'destinationname', value);

  @override
  String? get email => RealmObjectBase.get<String>(this, 'email') as String?;
  @override
  set email(String? value) => RealmObjectBase.set(this, 'email', value);

  @override
  DateTime get enddate =>
      RealmObjectBase.get<DateTime>(this, 'enddate') as DateTime;
  @override
  set enddate(DateTime value) => RealmObjectBase.set(this, 'enddate', value);

  @override
  ObjectId get listingId =>
      RealmObjectBase.get<ObjectId>(this, 'listingId') as ObjectId;
  @override
  set listingId(ObjectId value) =>
      RealmObjectBase.set(this, 'listingId', value);

  @override
  String? get name => RealmObjectBase.get<String>(this, 'name') as String?;
  @override
  set name(String? value) => RealmObjectBase.set(this, 'name', value);

  @override
  ObjectId get ownerId =>
      RealmObjectBase.get<ObjectId>(this, 'owner_id') as ObjectId;
  @override
  set ownerId(ObjectId value) => RealmObjectBase.set(this, 'owner_id', value);

  @override
  DateTime get startDate =>
      RealmObjectBase.get<DateTime>(this, 'startDate') as DateTime;
  @override
  set startDate(DateTime value) =>
      RealmObjectBase.set(this, 'startDate', value);

  @override
  int get totalprice => RealmObjectBase.get<int>(this, 'totalprice') as int;
  @override
  set totalprice(int value) => RealmObjectBase.set(this, 'totalprice', value);

  @override
  String? get tripcoverimage =>
      RealmObjectBase.get<String>(this, 'tripcoverimage') as String?;
  @override
  set tripcoverimage(String? value) =>
      RealmObjectBase.set(this, 'tripcoverimage', value);

  @override
  DateTime? get tripenddate =>
      RealmObjectBase.get<DateTime>(this, 'tripenddate') as DateTime?;
  @override
  set tripenddate(DateTime? value) =>
      RealmObjectBase.set(this, 'tripenddate', value);

  @override
  String? get tripname =>
      RealmObjectBase.get<String>(this, 'tripname') as String?;
  @override
  set tripname(String? value) => RealmObjectBase.set(this, 'tripname', value);

  @override
  DateTime? get tripstartdate =>
      RealmObjectBase.get<DateTime>(this, 'tripstartdate') as DateTime?;
  @override
  set tripstartdate(DateTime? value) =>
      RealmObjectBase.set(this, 'tripstartdate', value);

  @override
  Stream<RealmObjectChanges<AllReservations>> get changes =>
      RealmObjectBase.getChanges<AllReservations>(this);

  @override
  AllReservations freeze() =>
      RealmObjectBase.freezeObject<AllReservations>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(AllReservations._);
    return const SchemaObject(
        ObjectType.realmObject, AllReservations, 'allreservation', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('createdAt', RealmPropertyType.timestamp, optional: true),
      SchemaProperty('destinationname', RealmPropertyType.string,
          optional: true),
      SchemaProperty('email', RealmPropertyType.string, optional: true),
      SchemaProperty('enddate', RealmPropertyType.timestamp),
      SchemaProperty('listingId', RealmPropertyType.objectid),
      SchemaProperty('name', RealmPropertyType.string, optional: true),
      SchemaProperty('ownerId', RealmPropertyType.objectid, mapTo: 'owner_id'),
      SchemaProperty('startDate', RealmPropertyType.timestamp),
      SchemaProperty('totalprice', RealmPropertyType.int),
      SchemaProperty('tripcoverimage', RealmPropertyType.string,
          optional: true),
      SchemaProperty('tripenddate', RealmPropertyType.timestamp,
          optional: true),
      SchemaProperty('tripname', RealmPropertyType.string, optional: true),
      SchemaProperty('tripstartdate', RealmPropertyType.timestamp,
          optional: true),
    ]);
  }
}
