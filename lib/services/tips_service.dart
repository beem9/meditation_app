import 'package:dio/dio.dart';
import 'package:meditation_app/models/tips.dart';
import 'package:meditation_app/services/client.dart';

class Tipservice {
  Future<List<Tips>> getTipsListApi() async {
    try {
      final response = await ApiClient.get("/tips");
      if (response.statusCode == 200) {
        final List<Tips> listOfTips =
            List.from(response.data).map((e) => Tips.fromJson(e)).toList();
        return listOfTips;
      }
      return [];
    } catch (e) {
      throw e.toString();
    }
  }

  createTipsApi(String tip) async {
    try {
      final Response response = await ApiClient.post(
        "/tips",
        data: {"text": tip},
      );
      return response.data;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<Tips>> deleteTipApi(int id) async {
    try {
      final Response response = await ApiClient.delete("/tips/$id");
      return response.data;
    } catch (e) {
      throw "Error";
    }
  }
}
