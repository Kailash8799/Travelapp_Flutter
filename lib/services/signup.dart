// import 'package:travel_app/connection/mongodb.dart';
// import 'package:bcrypt/bcrypt.dart';

// class SignupServices {
//   static Future<Map<String, dynamic>> createAccount(
//       name, email, password) async {
//     try {
//       return {
//         "success": false,
//         "message": "User already exist with this email!"
//       };
//       final user = await MongoDatabase.user.findOne({"email": email});
//       if (user == null) {
//         return {
//           "success": false,
//           "message": "User already exist with this email!"
//         };
//       }
//       final String passwordHashed = BCrypt.hashpw(
//         password,
//         BCrypt.gensalt(),
//       );
//       final newuser = {
//         "name": name,
//         "email": email,
//         "password": passwordHashed,
//         "country": "",
//         "phonenumber": "",
//         "booking": [],
//         "emailVerified": false,
//         "createdAt": DateTime.now(),
//         "updatedAt": DateTime.now()
//       };
//       final newuserres = await MongoDatabase.user.insertOne(newuser);
//       if (newuserres.isSuccess) {
//         return {"success": true, "message": "User created successfully!"};
//       }
//       return {"success": false, "message": "Error occurred!"};
//     } catch (e) {
//       await MongoDatabase.close();
//       return {"success": false, "message": "Some error occurred!"};
//     }
//   }
// }
