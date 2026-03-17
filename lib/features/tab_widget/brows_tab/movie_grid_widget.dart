import 'package:flutter/material.dart';
import 'package:movies/core/assets_image/app_assets.dart';
import 'package:movies/features/tab_widget/brows_tab/movie_card_widget.dart';

class MoviesGridWidget extends StatelessWidget {
  MoviesGridWidget({super.key});

  final List<String> moviesImages = [
    AppAssets.movieOne,
    AppAssets.movieTow,
    AppAssets.movieThree,
    AppAssets.movieFour,
    AppAssets.movieFive,
    AppAssets.movieSix,
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: moviesImages.length,
      itemBuilder: (context, index) {
        return MovieCardWidget(
          image: moviesImages[index],
        );
      },
    );
  }
}
