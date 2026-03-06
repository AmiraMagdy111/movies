import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/Movies_response.dart';
class ApiService {
  static const String baseUrl = "movies-api.accel.li";
  static const String moviesEndPoint = "/api/v2/list_movies.json";
 static Future<MoviesResponse> getLatestMovies() async{
    Uri url = Uri.https(baseUrl,moviesEndPoint,{
      "limit" : "10",
      "sort_by" : "year",
      "order_by" : "desc"
    });
    try {
      http.Response response = await http.get(url);
      var json = jsonDecode(response.body);
      MoviesResponse moviesResponse = MoviesResponse.fromJson(json);
      return moviesResponse;
    }catch (e) {
      throw Exception("Error loading movies");
    }
    }
 }
