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

  void toggleFavorite(Music music) {
    music.isFavorite = !music.isFavorite!;
    notifyListeners();
  }

  // New method to get the list of favorited tracks
  List<Music> getFavoritedTracks() {
    return musicList.where((music) => music.isFavorite!).toList();
  }
}
