import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiManager {
  static Future<Map<String, dynamic>> getBrowseData() async {
    var url = Uri.parse(
      'https://yts.lt/api/v2/list_movies.json?limit=50',
    );

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        List movies = data['data']['movies'] ?? [];

        Set<String> genresSet = {};

        for (var movie in movies) {
          if (movie['genres'] != null) {
            for (var genre in movie['genres']) {
              genresSet.add(genre.toString());
            }
          }
        }

        return {
          "movies": movies,
          "genres": genresSet.toList(),
        };
      } else {
        return {
          "movies": [],
          "genres": [],
        };
      }
    } catch (e) {
      print(e);
      return {
        "movies": [],
        "genres": [],
      };
    }
  }
}