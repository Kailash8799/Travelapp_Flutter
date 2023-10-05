import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart';
import 'package:travel_app/realm/realm_services.dart';

class AppServices with ChangeNotifier {
  String id;
  Uri baseUrl;
  App app;
  User? currentUser;
  AppServices(this.id, this.baseUrl)
      : app = App(AppConfiguration(id, baseUrl: baseUrl));

  Future<Map<String, dynamic>> logInUserEmailPassword(
      String email, String password, BuildContext context) async {
    try {
      await currentUser?.logOut();
      User loggedInUser =
          await app.logIn(Credentials.emailPassword(email, password));
      if (!context.mounted) {
        return {"success": false, "message": "Some error occurred!"};
      }
      final realmServices = Provider.of<RealmServices>(context, listen: false);
      currentUser = loggedInUser;
      realmServices.currentUser = loggedInUser;
      notifyListeners();
      return {"success": true, "message": "Login successfully!"};
    } catch (e) {
      return {"success": false, "message": "Some error occurred!"};
    }
  }

  Future<Map<String, dynamic>> registerUserEmailPassword(
      String email, String password, String name, BuildContext context) async {
    try {
      await currentUser?.logOut();
      EmailPasswordAuthProvider authProvider = EmailPasswordAuthProvider(app);
      await authProvider.registerUser(email, password);
      User loggedInUser =
          await app.logIn(Credentials.emailPassword(email, password));
      if (!context.mounted) {
        return {"success": false, "message": "Some error occurred!"};
      }
      final realmServices = Provider.of<RealmServices>(context, listen: false);
      await realmServices.createUser(email, password, name, loggedInUser.id);
      loggedInUser.logOut();
      notifyListeners();
      return {"success": true, "message": "User created successfully!"};
    } catch (e) {
      // if (e.runtimeType == RealmInvalidCredentialsException) {}else{}
      return {"success": false, "message": "Some error occurred!"};
    }
  }

  Future<void> logOut() async {
    await currentUser?.logOut();
    currentUser = null;
  }
}
