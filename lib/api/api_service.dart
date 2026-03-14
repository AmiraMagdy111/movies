import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/api/models/movie_suggestions_pesponse/Movie_suggestions_response.dart';
import 'package:movies/api/models/movies_details_response/movies_details_response.dart';
import 'models/movies_response/Movies_response.dart';
class ApiService {
  static const String baseUrl = "movies-api.accel.li";
  static const String moviesEndPoint = "/api/v2/list_movies.json";
  static const String moviesDetailsEndPoint = "/api/v2/movie_details.json";
  static const String movieSuggestionsEndPoint = "/api/v2/movie_suggestions.json";

  static Future<MoviesResponse> getLatestMovies() async {
    Uri url = Uri.https(baseUrl, moviesEndPoint, {
      "limit": "10",
      "sort_by": "year",
      "order_by": "desc"
    });
    try {
      http.Response response = await http.get(url);
      var json = jsonDecode(response.body);
      MoviesResponse moviesResponse = MoviesResponse.fromJson(json);
      return moviesResponse;
    } catch (e) {
      throw Exception("Error loading movies");
    }
  }

  static Future<MoviesDetailsResponse> getMovieDetails(int movieId) async {
    Uri url = Uri.https(baseUrl, moviesDetailsEndPoint, {
      "movie_id": movieId.toString(),
      "with_images": "true",
      "with_cast": "true"
    });

    try {
      http.Response response = await http.get(url);
      var json = jsonDecode(response.body);

      MoviesDetailsResponse moviesDetailsResponse =
      MoviesDetailsResponse.fromJson(json);

      return moviesDetailsResponse;
    } catch (e) {
      throw Exception("Error loading movie details");
    }
  }

  static Future<MovieSuggestionsResponse> getSimilarMovies(int movieId) async {
    Uri url = Uri.https(baseUrl, movieSuggestionsEndPoint, {
      "movie_id": movieId.toString(),
    });

    try {
      print("URL: $url");

      http.Response response = await http.get(url);

      print("Status Code: ${response.statusCode}");
      print("Body: ${response.body}");

      var json = jsonDecode(response.body);
      return MovieSuggestionsResponse.fromJson(json);

    } catch (e) {
      print("ERROR: $e");
      throw Exception("Error loading similar movies");
    }
  }
  }