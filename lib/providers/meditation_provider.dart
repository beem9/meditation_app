import 'package:flutter/material.dart';
import 'package:meditation_app/models/exercises.dart';
import 'package:meditation_app/models/meditation.dart';
import 'package:meditation_app/models/music.dart';
import 'package:meditation_app/services/exercises_service.dart';
import 'package:meditation_app/services/meditation_service.dart';
import 'package:meditation_app/services/music_service.dart';

class MeditationProvider extends ChangeNotifier {
  List<Meditation> meditataionList = [];

  final MeditationService _meditaationService = MeditationService();

  Future<void> getMeditationList() async {
    meditataionList = await _meditaationService.getMeditationListApi();
    notifyListeners();
  }
}
