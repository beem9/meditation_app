import 'package:flutter/material.dart';
import 'package:meditation_app/models/exercises.dart';
import 'package:meditation_app/services/exercises_service.dart';

class ExerciseProvider extends ChangeNotifier {
  List<Exercises> exerciseList = [];

  final ExercisesService _exerciseService = ExercisesService();

  Future<List<Exercises>> getExerciseList() async {
    print("teeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeest");
    exerciseList = await _exerciseService.getExercisesListApi();
    print(exerciseList);
    print("test2222222222222222222222");
    notifyListeners();
    return exerciseList;
  }
}
