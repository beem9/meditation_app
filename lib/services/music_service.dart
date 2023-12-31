import 'package:meditation_app/models/music.dart';
import 'package:meditation_app/services/client.dart';

class MusicService {
  Future<List<Music>> getMusicApi() async {
    try {
      final response = await ApiClient.get("/music");
      if (response.statusCode == 200) {
        final List<Music> listOfMusic =
            List.from(response.data).map((e) => Music.fromJson(e)).toList();
        return listOfMusic;
      }
      return [];
    } catch (e) {
      throw e.toString();
    }
  }
}
