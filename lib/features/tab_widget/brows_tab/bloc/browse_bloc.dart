import 'package:flutter_bloc/flutter_bloc.dart';
import '../api/api_manger.dart';
import 'browse_event.dart';
import 'browse_state.dart';

class BrowseBloc extends Bloc<BrowseEvent, BrowseState> {
  BrowseBloc() : super(BrowseInitial()) {

    on<LoadGenresEvent>((event, emit) async {
      emit(BrowseLoading());

      try {
        var genres = await ApiManager.getGenres();
        emit(BrowseSuccess(genres));
      } catch (e) {
        emit(BrowseError());
      }

    });

  }
}