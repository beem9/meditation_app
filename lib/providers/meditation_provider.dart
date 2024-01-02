import 'package:flutter/material.dart';

import 'package:meditation_app/models/meditation.dart';

import 'package:meditation_app/services/meditation_service.dart';

class MeditationProvider extends ChangeNotifier {
  List<Meditation> meditationList = [];

  final MeditationService _meditaationService = MeditationService();

  Future<void> getMeditationList() async {
    meditationList = await _meditaationService.getMeditationListApi();
    notifyListeners();
  }
}
