
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/api/api_service.dart';
import 'package:movies/features/movies_details/widgets/cast_section.dart';
import 'package:movies/features/movies_details/widgets/movie_header_section.dart';
import 'package:movies/features/movies_details/widgets/screen_shot_section.dart';
import 'package:movies/features/movies_details/widgets/similar_section.dart';
import 'package:movies/features/movies_details/widgets/summary_section.dart';
import '../../api/models/movies_details_response/movies_details_response.dart';
import '../../api/models/movies_response/Movies.dart';
class MoviesDetails extends StatefulWidget {
  final int movieId;

   MoviesDetails({super.key, required this.movieId});

  @override
  State<MoviesDetails> createState() => _MoviesDetailsState();
}

class _MoviesDetailsState extends State<MoviesDetails> {
  late Future<MoviesDetailsResponse> movieDetailsResponse;
  late Future similarMoviesFuture;


  @override
  void initState() {
    super.initState();
    movieDetailsResponse = ApiService.getMovieDetails(widget.movieId);
    similarMoviesFuture = ApiService.getSimilarMovies(widget.movieId);

  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(

      future:movieDetailsResponse,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text("Error loading movie"));
        }
        Movies movie = snapshot.data!.data!.movie!;
        return Scaffold(
          body: ListView(
            padding: EdgeInsets.zero,
            children: [
              MovieHeaderSection(movie: movie),
              SizedBox(height: 16.h),
              ScreenShotSection(
                images: movie.images??[],
              ),
              SizedBox(height: 16.h),
              FutureBuilder(
                future: similarMoviesFuture,
                builder: (context, snapshot) {

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Text("Error loading similar movies");
                  }

                  var movies = snapshot.data?.data?.movies ?? [];

                  return SimilarSection(
                    movies: movies,
                  );
                },
              ),

              SizedBox(height: 16.h),
                SummarySection(
                  summary: movie.descriptionFull ?? '',
                ),
              SizedBox(height: 16.h),
              CastSection(
                cast: movie.cast ?? [],
              )
            ],
          ),
        );
      },
    );
  }
}
