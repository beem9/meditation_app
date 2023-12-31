import 'package:dio/dio.dart';
import 'package:meditation_app/models/token.dart';
import 'package:meditation_app/models/user.dart';
import 'package:meditation_app/services/client.dart';

class AuthService {
  Future<String> signup({required User user}) async {
    try {
      if (user.username.isNotEmpty && user.password!.isNotEmpty) {
        final Response response =
            await ApiClient.post("/signup", data: user.toJson()

                // {
                //   "username": "${user.username}",
                //   "password": "${user.password}",
                // "picture": MultipartFile.fromFile(user.picture!.path)
                // }

                );
        print(response.data);
        Token tokenModle = Token.fromJson(response.data);
        return tokenModle.token.toString();
      }
      return "";
    } catch (e) {
      throw e.toString();
    }
  }

  Future signin({required User user}) async {
    try {
      final Response response =
          await ApiClient.post("/signin", data: user.toJson());

      Token tokenModel = Token.fromJson(response.data);
      print(tokenModel.token);
      return tokenModel.token;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<User> getUserApi() async {
    User placeholder = User(username: 'username', password: 'password');
    try {
      final responseValue = await ApiClient.get("/");
      if (responseValue.statusCode == 200) {
        final User user = User.fromJson(responseValue.data);
        return user;
      }
      return placeholder;
    } catch (e) {
      throw e.toString();
    }
  }
}



///username : "Ali"
///
///
///
///