import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/features/tab_widget/brows_tab/genre_modle/genre_modle.dart';


class ApiManager {

  static Future<List<Genre>> getGenres() async {

    var url = Uri.parse(
        "https://api.themoviedb.org/3/genre/movie/list?api_key=API_KEY"
    );

    var response = await http.get(url);

    var data = jsonDecode(response.body);

    List genres = data["genres"];

    return genres.map((e) => Genre.fromJson(e)).toList();
  }

}