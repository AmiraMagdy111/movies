import 'package:flutter/material.dart';
import 'package:movies/features/tab_widget/brows_tab/category_widget.dart';
import 'package:movies/features/tab_widget/brows_tab/movie_grid_widget.dart';
class BrowseScreen extends StatelessWidget {
  const BrowseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoryListWidget(),
        SizedBox(height: 16),
        Expanded(
          child: MoviesGridWidget(),
        )
      ],
    );
  }
}