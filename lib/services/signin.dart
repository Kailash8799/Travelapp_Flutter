// import 'package:bcrypt/bcrypt.dart';
// import 'package:travel_app/connection/mongodb.dart';

// class SigninServices {
//   static Future<Map<String, dynamic>> loginToApp(email, password) async {
//     try {
//       final user = await MongoDatabase.user.findOne({"email": email});
//       if (user == null) {
//         return {
//           "success": false,
//           "message": "User does't exist with this email!"
//         };
//       }
//       // if (user["emailVerified"] == false) {
//       //   return {"success": false, "message": "Email not verified!"};
//       // }
//       final bool checkPassword = BCrypt.checkpw(
//         password,
//         user["password"],
//       );
//       if (checkPassword) {
//         return {"success": true, "message": "Login", "id": user["_id"]};
//       }
//       return {"success": false, "message": "Invalid credentials!"};
//     } catch (e) {
//       return {"success": false, "message": "Some error occurred!"};
//     }
//   }
// }
