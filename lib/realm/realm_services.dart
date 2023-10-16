import 'package:travel_app/models/reservation.dart';
import 'package:travel_app/realm/schemas.dart';
import 'package:realm/realm.dart';
import 'package:flutter/material.dart';

class RealmServices with ChangeNotifier {
  static const String queryAllName = "getAllItemsSubscription";
  static const String queryMyItemsName = "getMyItemsSubscription";

  bool offlineModeOn = false;
  bool isWaiting = false;
  late Realm realm;
  User? currentUser;
  App app;

  RealmServices(this.app) {
    if (app.currentUser != null || currentUser != app.currentUser) {
      currentUser ??= app.currentUser;
      realm = Realm(Configuration.flexibleSync(currentUser!, [
        Userdata.schema,
        Place.schema,
        Listing.schema,
        ListingFacilities.schema,
        PlaceFacilities.schema,
        AllReservations.schema
      ]));
      if (realm.subscriptions.isEmpty) {
        updateSubscriptions();
        notifyListeners();
      }
    }
  }

  Future<void> updateSubscriptions() async {
    realm.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.clear();
      mutableSubscriptions.add(realm.all<Userdata>());
      mutableSubscriptions.add(realm.all<Place>());
      mutableSubscriptions.add(realm.all<Listing>());
      mutableSubscriptions.add(realm.all<AllReservations>());
    });
    await realm.subscriptions.waitForSynchronization();
    notifyListeners();
  }

  Future<void> sessionSwitch() async {
    offlineModeOn = !offlineModeOn;
    if (offlineModeOn) {
      realm.syncSession.pause();
    } else {
      try {
        isWaiting = true;
        notifyListeners();
        realm.syncSession.resume();
        await updateSubscriptions();
      } finally {
        isWaiting = false;
      }
    }
    notifyListeners();
  }

  Future<void> switchSubscription(bool value) async {
    if (!offlineModeOn) {
      try {
        isWaiting = true;
        notifyListeners();
        await updateSubscriptions();
      } finally {
        isWaiting = false;
      }
    }
    notifyListeners();
  }

  // void createItem(String summary, bool isComplete) {
  //   final newItem =
  //       Item(ObjectId(), summary, currentUser!.id, isComplete: isComplete);
  //   realm.write<Item>(() => realm.add<Item>(newItem));
  //   notifyListeners();
  // }

  Future<void> createUser(
      String email, String password, String name, String ownerId) async {
    try {
      final newItem = Userdata(
        ObjectId(),
        ownerId,
        email,
        password,
        name: name,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        emailVerified: false,
      );
      realm.write<Userdata>(() => realm.add<Userdata>(newItem));
    } catch (e) {
      print(e);
    } finally {
      notifyListeners();
    }
  }

  Future<Map<String, dynamic>> bookHotel(
      ObjectId listingid,
      ObjectId userid,
      int totalprice,
      DateTime startdate,
      DateTime enddate,
      String destinationname,
      String tripcoverimage,
      DateTime tripenddate,
      String tripname,
      DateTime tripstartdate,
      String name,
      String email) async {
    try {
      final newlisting = AllReservations(
          ObjectId(), enddate, listingid, userid, startdate, totalprice,
          createdAt: DateTime.now(),
          destinationname: destinationname,
          email: email,
          name: name,
          tripcoverimage: tripcoverimage,
          tripenddate: tripenddate,
          tripname: tripname,
          tripstartdate: tripstartdate);
      AllReservations newreservation = realm
          .write<AllReservations>(() => realm.add<AllReservations>(newlisting));
      return {
        "success": true,
        "message": "Success",
        "id": newreservation.id,
        "newreservation": newreservation
      };
    } catch (e) {
      print(e);
      return {"success": false, "message": "Some error occurred!"};
    }
  }
  // void deleteItem(Item item) {
  //   realm.write(() => realm.delete(item));
  //   notifyListeners();
  // }

  // Future<void> updateItem(Item item,
  //     {String? summary, bool? isComplete}) async {
  //   realm.write(() {
  //     if (summary != null) {
  //       item.summary = summary;
  //     }
  //     if (isComplete != null) {
  //       item.isComplete = isComplete;
  //     }
  //   });
  //   notifyListeners();
  // }
  Future<Map<String, dynamic>> updatebookHotel({
    required AllReservations reservations,
    required String tripname,
    required String destinationname,
    required DateTime startdate,
    required DateTime enddate,
    required String image,
  }) async {
    try {
      realm.write(() {
        reservations.tripname = tripname;
        reservations.destinationname = destinationname;
        reservations.tripstartdate = startdate;
        reservations.tripenddate = enddate;
        reservations.tripcoverimage = image;
      });
      return {
        "success": true,
        "message": "Success",
      };
    } catch (e) {
      print(e);
      return {"success": false, "message": "Some error occurred!"};
    } finally {
      notifyListeners();
    }
  }

  Future<void> logout() async {
    if (currentUser != null &&
        currentUser!.provider != AuthProviderType.anonymous &&
        app.currentUser != null) {
      await app.currentUser?.logOut();
      currentUser = null;
      final anonCredentials = Credentials.anonymous();
      currentUser = await app.logIn(anonCredentials);
    }
    notifyListeners();
  }

  Future<void> close() async {
    if (currentUser != null) {
      currentUser = null;
    }
    realm.close();
  }
}
