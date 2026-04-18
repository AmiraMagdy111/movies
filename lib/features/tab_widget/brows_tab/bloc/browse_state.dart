abstract class BrowseState {}

class BrowseInitial extends BrowseState {}

class BrowseLoading extends BrowseState {}

class BrowseSuccess extends BrowseState {
  final List<String> genres;
  final List movies;

  BrowseSuccess({
    required this.genres,
    required this.movies,
  });
}

class BrowseError extends BrowseState {}