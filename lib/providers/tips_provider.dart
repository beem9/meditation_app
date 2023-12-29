import 'package:flutter/material.dart';
import 'package:meditation_app/models/tips.dart';
import 'package:meditation_app/services/tips_service.dart';

class TipProvider extends ChangeNotifier {
  List<Tips> tipsList = [];

  final Tipservice _tipService = Tipservice();

  Future<void> tipList() async {
    tipsList = await _tipService.getTipsListApi();
    notifyListeners();
  }

  Future<void> createNewTip(String tip) async {
    await _tipService.createTipsApi(tip);
    await tipList();
  }

  Future<void> deleteTip(int id) async {
    await _tipService.deleteTipApi(id);
    await tipList();
  }
}
