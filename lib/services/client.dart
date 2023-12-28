import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

String baseUrl = "https://coded-meditation.eapi.joincoded.com";

class ApiClient {
  static final Dio dio = Dio(
    BaseOptions(baseUrl: baseUrl),
  );

  static Future<void> addAuthToken() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    String? token = shared.getString('token');

    if (token != null) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }
  }

  static Future<Response> get(String path) async {
    await addAuthToken();
    try {
      print(dio.options.headers['Authorization'].toString());
      return await dio.get(path);
    } catch (error) {
      throw error.toString();
    }
  }

  static Future<Response> post(String path, {Object? data}) async {
    await addAuthToken();
    try {
      return await dio.post(path, data: data);
    } catch (error) {
      throw error.toString();
    }
  }

  static Future<Response> put(String path, {Object? data}) async {
    await addAuthToken();
    try {
      return await dio.put(path, data: data);
    } catch (error) {
      throw error.toString();
    }
  }
}

class NamedRoutes {
  static final String login = "signin";
}
