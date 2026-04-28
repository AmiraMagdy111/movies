
import 'package:movies/model/history_model/history_model.dart';
import '../../../model/user_model/user_model.dart';
import '../../../model/watchlist_movies_model/watchlist_movies_model.dart';

abstract class FirebaseFirestoreDataSource {
  Future<void> addUserToFireStore({required UserModel user});
  Future<UserModel> getUserFromFireStore({ required String uid});
  Future<void> updateUserInFireStore({required UserModel user});
  Future<void> deleteUserFromFireStore ({ required String uid});
  Future<void> addMovieToFirestore({required WatchlistMoviesModel movie ,required String uid});
  Stream<List<WatchlistMoviesModel>>getMoviesFromFirestore({
    required String uid,});
  Future<void> addHistoryToFirestore({required HistoryModel history , required String uid});
  Stream<List<HistoryModel>>getHistoryFromFirestore({
    required String uid,});

}

