import 'package:meditation_app/models/exercises.dart';
import 'package:meditation_app/models/meditation.dart';
import 'package:meditation_app/services/client.dart';

class MeditationService {
  Future<List<Meditation>> getMeditationListApi() async {
    try {
      final response = await ApiClient.get("/meditation");

      if (response.statusCode == 200) {
        final List<Meditation> listOfMeditation = List.from(response.data)
            .map((e) => Meditation.fromJson(e))
            .toList();
        print(listOfMeditation);
        return listOfMeditation;
      }
      return [];
    } catch (e) {
      throw e.toString();
    }
  }
}
