import 'package:flutter/material.dart';
import 'package:meditation_app/models/exercises.dart';
import 'package:meditation_app/services/exercises_service.dart';

class ExerciseProvider extends ChangeNotifier {
  List<Exercises> exerciseList = [];

  final ExercisesService _exerciseService = ExercisesService();

  Future<List<Exercises>> getExerciseList() async {
    exerciseList = await _exerciseService.getExercisesListApi();
    print(exerciseList);

    notifyListeners();
    return exerciseList;
  }

  Future<void> finishExercise(int id) async {
    await _exerciseService.finishExerciseApi(id);
    await getExerciseList();
  }
}
