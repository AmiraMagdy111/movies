import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/clean_architecture/data_source/remote/firebase_firestore_data_source.dart';
import 'package:movies/model/history_model/history_model.dart';
import 'package:movies/model/user_model/user_model.dart';
import 'package:movies/model/watchlist_movies_model/watchlist_movies_model.dart';

@LazySingleton(as: FirebaseFirestoreDataSource)
class FirebaseFirestoreRemoteDataSource  implements FirebaseFirestoreDataSource {
  final FirebaseFirestore dataBase = FirebaseFirestore.instance;

  CollectionReference<UserModel> getUserCollection() {
    CollectionReference <UserModel> userCollection = dataBase.collection(
        "users").withConverter(
        fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
        toFirestore: (user, _) => user.toJson());
    return userCollection;
  }
  CollectionReference<WatchlistMoviesModel> getMovieCollection(String uid) {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .collection("watchlist")
        .withConverter<WatchlistMoviesModel>(
      fromFirestore: (snapshot, _) =>
          WatchlistMoviesModel.fromJson(snapshot.data()!,snapshot.id),
      toFirestore: (model, _) => model.toJson(),
    );
  }

  CollectionReference<HistoryModel> getHistoryCollection(String uid){
    return FirebaseFirestore.instance.collection("users")
        .doc(uid).collection("history")
        .withConverter<HistoryModel>(fromFirestore: (snapShot,_)=>
        HistoryModel.fromJson(snapShot.data()!,snapShot.id)
        , toFirestore: (model,_) => model.toJson());
  }

  @override
  Future<void> addUserToFireStore({required UserModel user}) {
    CollectionReference <UserModel> userCollection = getUserCollection();
    DocumentReference<UserModel> userDocument = userCollection.doc(user.id);
    return userDocument.set(user);
  }

  @override
  Future<UserModel> getUserFromFireStore({required String uid}) async {
    CollectionReference <UserModel> userCollection = getUserCollection();
    DocumentReference<UserModel> userDocument = userCollection.doc(uid);
    DocumentSnapshot<UserModel> documentSnapshot = await userDocument.get();
    UserModel user = documentSnapshot.data()!;
    return user;
  }

  @override
  Future<void> updateUserInFireStore({required UserModel user}) {
    CollectionReference <UserModel> userCollection = getUserCollection();
    DocumentReference<UserModel> userDocument = userCollection.doc(user.id);
    return userDocument.update(user.toJson());
  }

  @override
  Future<void> deleteUserFromFireStore({required String uid}) async {
    CollectionReference <UserModel> userCollection = getUserCollection();
    DocumentReference<UserModel> userDocument = userCollection.doc(uid);
    return await userDocument.delete();
  }

  @override
  Future<void> addMovieToFirestore(
      {required WatchlistMoviesModel movie, required String uid}) async {
    CollectionReference<
        WatchlistMoviesModel> movieCollection = getMovieCollection(uid);
    if (movie.id == null) {
      throw Exception("Movie id is null");
    }
    DocumentReference<WatchlistMoviesModel> movieDocument = movieCollection.doc(
        movie.id);
     await movieDocument.set(movie);
  }
  @override
  Stream<List<WatchlistMoviesModel>> getMoviesFromFirestore({
    required String uid,
  }) {
    return getMovieCollection(uid)
        .snapshots()
        .map((querySnapshot) =>
        querySnapshot.docs.map((doc) => doc.data()).toList());
  }

  @override
  Future<void> addHistoryToFirestore({required HistoryModel history, required String uid}) async{
    CollectionReference<HistoryModel> historyCollection = getHistoryCollection(uid);
    DocumentReference<HistoryModel> historyDocument =  historyCollection.doc(history.id);
    await historyDocument.set(history);
  }

  @override
  Stream<List<HistoryModel>> getHistoryFromFirestore({required String uid}) {
  return getHistoryCollection(uid).
   orderBy("timestamp",descending: true).
   snapshots().map((querySnapshot) => querySnapshot.docs.map((doc) => doc.data()).toList());
  }
}
