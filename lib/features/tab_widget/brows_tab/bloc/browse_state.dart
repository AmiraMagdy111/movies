
import '../genre_modle/genre_modle.dart';


abstract class BrowseState {}

class BrowseInitial extends BrowseState {}

class BrowseLoading extends BrowseState {}

class BrowseSuccess extends BrowseState {
  List<Genre> genres;

  BrowseSuccess(this.genres);
}

class BrowseError extends BrowseState {}