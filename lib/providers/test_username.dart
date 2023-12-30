// import 'package:jwt_decoder/jwt_decoder.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class PersonalUser {
//   Future<String> getUsernameFromToken() async {
//     SharedPreferences shared = await SharedPreferences.getInstance();
//     String token = shared.getString('token') ?? "";

//     Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

//     String username = decodedToken['username'];

//     return username;
//   }
// }
