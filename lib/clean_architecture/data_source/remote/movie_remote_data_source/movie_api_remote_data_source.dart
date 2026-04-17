import 'dart:convert';

// import 'package:movies/api/models/movies_response/Movies_response.dart';
// import 'package:movies/clean_architecture/data_source/remote/movie_remote_data_source/movie_remote_data_source.dart';
// import 'package:http/http.dart' as http;
// import 'package:movies/api/api_constant.dart';
//
// class MovieApiRemoteDataSource implements MovieRemoteDataSource {
//   @override
//    Future<MoviesResponse> getLatestMovies() async {
//     Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.moviesEndPoint,{
//       "limit": "10",
//       "sort_by": "year",
//       "order_by": "desc"
//      });
//     try {
//       http.Response response = await http.get(url);
//       var json = jsonDecode(response.body);
//       MoviesResponse moviesResponse = MoviesResponse.fromJson(json);
//       return moviesResponse;
//     } catch (e) {
//       throw Exception("Error loading movies");
//     }
//   }
// }