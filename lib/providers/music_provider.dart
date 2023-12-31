import 'package:flutter/material.dart';

import 'package:meditation_app/models/music.dart';

import 'package:meditation_app/services/music_service.dart';

class MusicProvider extends ChangeNotifier {
  List<Music> musicList = [];

  final MusicService _musicService = MusicService();

  Future<void> getMusicList() async {
    musicList = await _musicService.getMusicApi();
    notifyListeners();
  }
}
