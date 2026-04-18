import 'package:flutter_bloc/flutter_bloc.dart';
import '../api/api_manger.dart';
import 'browse_event.dart';
import 'browse_state.dart';

class BrowseBloc extends Bloc<BrowseEvent, BrowseState> {
  BrowseBloc() : super(BrowseInitial()) {
    on<LoadGenresEvent>((event, emit) async {
      emit(BrowseLoading());

      try {
        var data = await ApiManager.getBrowseData();

        List<String> genres = List<String>.from(data['genres'] ?? []);
        List movies = data['movies'] ?? [];

        if (genres.isNotEmpty) {
          emit(BrowseSuccess(
            genres: genres,
            movies: movies,
          ));
        } else {
          emit(BrowseError());
        }
      } catch (e) {
        emit(BrowseError());
      }
    });
  }
}