import 'package:dio/dio.dart';
import 'package:meditation_app/models/exercises.dart';
import 'package:meditation_app/services/client.dart';

class ExercisesService {
  Future<List<Exercises>> getExercisesListApi() async {
    try {
      final response = await ApiClient.get("/exercises");

      if (response.statusCode == 200) {
        final List<Exercises> listOfExersices =
            List.from(response.data).map((e) => Exercises.fromJson(e)).toList();
        print(listOfExersices);
        return listOfExersices;
      }
      return [];
    } catch (e) {
      throw e.toString();
    }
  }

  finishExerciseApi(int id) async {
    try {
      final Response response = await ApiClient.post("/exercises/$id");
      return response.data;
    } catch (e) {
      throw e.toString();
    }
  }
}
