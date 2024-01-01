import 'package:flutter/material.dart';
import 'package:meditation_app/models/tips.dart';

import 'package:meditation_app/providers/auth_provider.dart';

import 'package:meditation_app/services/tips_service.dart';
import 'package:share_plus/share_plus.dart';

class TipProvider extends ChangeNotifier {
  List<Tips> tipsList = [];
  List<Tips> personalTipsList = [];
  List<Tips> _filteredTips = [];

  final Tipservice _tipService = Tipservice();

  Future<void> tipList() async {
    tipsList = await _tipService.getTipsListApi();
    notifyListeners();
  }

  // ... existing methods ...

  List<Tips> get filteredTips => _filteredTips;

  void filterTips(String query) {
    _filteredTips.clear();
    if (query.isEmpty) {
      // If the search query is empty, show all tips
      _filteredTips.addAll(tipsList);
    } else {
      // Filter tips based on the search query
      _filteredTips.addAll(tipsList.where((tip) =>
          tip.text!.toLowerCase().contains(query.toLowerCase()) ||
          tip.author!.toLowerCase().contains(query.toLowerCase())));
    }
    notifyListeners();
  }

  void shareTip(String tip) {
    try {
      if (tip != null && tip != null) {
        Share.share(tip); // Share the text of the tip
      }
    } catch (e) {
      print("Error sharing tip: $e");
    }
  }

  Future<void> personalTipList() async {
    personalTipsList = await _tipService.getTipsListApi();

    String localUsername = await AuthProvider().getUsernameFromToken();
    personalTipsList = personalTipsList
        .where(
          (element) =>
              element.author?.trim().toLowerCase() ==
              localUsername.trim().toLowerCase(),
        )
        .toList();
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

  Future<void> upVouteTip(int id) async {
    await _tipService.upVoteApi(id);
    await tipList();
  }

  Future<void> downVoteTip(int id) async {
    await _tipService.downVoteApi(id);
    await tipList();
  }
}
