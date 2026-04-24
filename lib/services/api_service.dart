import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie_model.dart';

class ApiService {
  final String baseUrl = "https://route-movie-apis.vercel.app/";

  Future<List<MovieModel>> getWatchList(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/favorites/all'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> list = jsonResponse['data'];
      return list.map((item) => MovieModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load watchlist');
    }
  }
}