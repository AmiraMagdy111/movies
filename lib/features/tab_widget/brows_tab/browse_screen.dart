import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies/features/tab_widget/brows_tab/bloc/browse_event.dart';

import 'package:movies/features/tab_widget/brows_tab/category_widget.dart';
import 'package:movies/features/tab_widget/brows_tab/movie_grid_widget.dart';

import 'bloc/browse_bloc.dart';


class BrowseScreen extends StatelessWidget {
  const BrowseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BrowseBloc()..add(LoadGenresEvent()),
      child: Column(
        children: [
          CategoryListWidget(),
          SizedBox(height: 16),
          Expanded(
            child: MoviesGridWidget(),
          ),
        ],
      ),
    );
  }
}