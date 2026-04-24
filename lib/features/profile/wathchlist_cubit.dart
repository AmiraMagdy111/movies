import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/api_service.dart';
import '../../models/movie_model.dart';

abstract class WatchlistState {}
class WatchlistInitial extends WatchlistState {}
class WatchlistLoading extends WatchlistState {}
class WatchlistLoaded extends WatchlistState {
  final List<MovieModel> movies;
  WatchlistLoaded(this.movies);
}
class WatchlistError extends WatchlistState {
  final String message;
  WatchlistError(this.message);
}

class WatchlistCubit extends Cubit<WatchlistState> {
  final ApiService apiService;
  WatchlistCubit(this.apiService) : super(WatchlistInitial());

  void getWatchList(String token) async {
    emit(WatchlistLoading());
    try {
      final movies = await apiService.getWatchList(token);
      emit(WatchlistLoaded(movies));
    } catch (e) {
      emit(WatchlistError(e.toString()));
    }
  }
}