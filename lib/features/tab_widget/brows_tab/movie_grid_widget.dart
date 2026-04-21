import 'package:flutter/material.dart';
import 'package:movies/features/tab_widget/brows_tab/movie_card_widget.dart';

class MoviesGridWidget extends StatelessWidget {
  final List movies;
  const MoviesGridWidget({super.key, required this.movies});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.67,
        crossAxisSpacing: 20,
        mainAxisSpacing: 8,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return
          MovieCardWidget(
            movie: movies[index],
          );
      },
    );
  }
}
