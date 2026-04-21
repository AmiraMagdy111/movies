import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/browse_bloc.dart';
import 'bloc/browse_event.dart';
import 'bloc/browse_state.dart';
import 'category_widget.dart';
import 'movie_grid_widget.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({super.key});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  String? selectedGenre;

  List filterMovies(List movies, String? genre) {
    if (genre == null) return movies;

    return movies.where((movie) {
      return movie['genres'] != null &&
          movie['genres'].contains(genre);
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    context.read<BrowseBloc>().add(LoadGenresEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrowseBloc, BrowseState>(
      builder: (context, state) {
        if (state is BrowseLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        else if (state is BrowseSuccess) {

          if (selectedGenre == null && state.genres.isNotEmpty) {
            selectedGenre = state.genres[0];
          }
          var moviesToShow =
          filterMovies(state.movies, selectedGenre);

          return Column(
            children: [
              CategoryListWidget(
                genres: state.genres,
                selectedGenre: selectedGenre,
                onTap: (genre) {
                  setState(() {
                    selectedGenre = genre;
                  });
                },
              ),
              Expanded(
                child: MoviesGridWidget(
                  movies: moviesToShow, 
                ),
              ),
            ],
          );
        }

        else {
          return const Center(
            child: Text("Something went wrong"),
          );
        }
      },
    );
  }
}