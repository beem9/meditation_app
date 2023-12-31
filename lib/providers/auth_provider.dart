import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:meditation_app/models/user.dart';
import 'package:meditation_app/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  final authService = AuthService();
  String token = "";

  User getUserFromToken() {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

    User user = User(
        id: decodedToken['id'],
        username: decodedToken['username'],
        imagePath: decodedToken['image'],
        exp: decodedToken['exp'],
        finishedExercises: decodedToken['finishedExercises'],
        iat: decodedToken['iat']);
    //print(user.imagePath);

    return user;
  }

  Future<String> signup({required User user}) async {
    token = await authService.signup(user: user);

    /// token to be saved in local storage
    notifyListeners();
    return token;
  }

  Future<String> signin({required User user}) async {
    token = await authService.signin(user: user);
    saveTokenInStorage(token);

    /// token to be saved in local storage
    notifyListeners();
    return token;
  }

  // saveTokenInStorage
  Future<void> saveTokenInStorage(String token) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.setString('token', token);
  }

  //readTokenFromStorage

  Future<String> getUsernameFromToken() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    token = shared.getString('token') ?? "";

    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

    String username = decodedToken['username'];

    return username;
  }

  Future<String> readFromStorage() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    token = shared.getString('token') ?? "";

    /// ??  null check operator
    notifyListeners();
    return token;
  }

  Future<void> updateUser({required User user}) async {
    authService.updateUserApi(user: user);

    /// token to be saved in local storage
    notifyListeners();
    return;
  }

  Future<void> logOut() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.setString("token", '');
    token = "";
    print(token);
    saveTokenInStorage(token);
    notifyListeners();
  }
}
