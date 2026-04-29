import 'package:flutter/material.dart';
import 'package:movies/core/routing/routes.dart';
import 'movie_card_widget.dart';

class MoviesGridWidget extends StatelessWidget {
  final List movies;
  const MoviesGridWidget({super.key,
    required this.movies});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(vertical:25),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.67,
        crossAxisSpacing: 20,
        mainAxisSpacing: 8,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return
            MovieCardWidget(onTap: () {
              Navigator.pushNamed(context, Routes.moviesDetails, arguments: movies[index]['id'],
              );
            },
              movie: movies[index],
          );
      },
    );
  }
}
