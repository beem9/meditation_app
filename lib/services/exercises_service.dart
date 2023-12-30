import 'package:dio/dio.dart';
import 'package:meditation_app/models/exercises.dart';
import 'package:meditation_app/models/tips.dart';
import 'package:meditation_app/services/client.dart';

class ExercisesService {
  Future<List<Exercises>> getExercisesListApi() async {
    try {
      final response = await ApiClient.get("/exercises");
      if (response.statusCode == 200) {
        final List<Exercises> listOfExersices = List.from(response.data)
            .map((e) => Tips.fromJson(e))
            .cast<Exercises>()
            .toList();
        return listOfExersices;
      }
      return [];
    } catch (e) {
      throw e.toString();
    }
  }
}
