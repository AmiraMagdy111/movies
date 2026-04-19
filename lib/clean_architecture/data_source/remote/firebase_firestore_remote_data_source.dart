import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/clean_architecture/data_source/remote/firebase_firestore_data_source.dart';
import 'package:movies/model/user_model/user_model.dart';
@LazySingleton(as: FirebaseFirestoreDataSource)
class FirebaseFirestoreRemoteDataSource  implements FirebaseFirestoreDataSource{
  final FirebaseFirestore dataBase = FirebaseFirestore.instance;
   CollectionReference<UserModel>getUserCollection(){
    CollectionReference <UserModel> userCollection = dataBase.collection("Users").withConverter(
        fromFirestore: (snapshot,_)=> UserModel.fromJson(snapshot.data()!),
        toFirestore: (user,_)=> user.toJson());
    return userCollection;
  }
  @override
  Future<void> addUserToFireStore({required UserModel user}) {
    CollectionReference <UserModel> userCollection = getUserCollection();
    DocumentReference<UserModel>  userDocument = userCollection.doc(user.id);
  return userDocument.set(user);

  }

  @override
  Future<UserModel> getUserFromFireStore({required String uid}) async {
    CollectionReference <UserModel> userCollection =  getUserCollection();
    DocumentReference<UserModel>  userDocument = userCollection.doc(uid);
 DocumentSnapshot<UserModel>  documentSnapshot = await userDocument.get();
 UserModel user = documentSnapshot.data()!;
 return user;
  }

  @override
  Future<void> updateUserInFireStore({required UserModel user}) {
    CollectionReference <UserModel> userCollection =  getUserCollection();
    DocumentReference<UserModel>  userDocument = userCollection.doc(user.id);
   return userDocument.update(user.toJson());
  }

  @override
  Future<void> deleteUserFromFireStore({required String uid}) async {
    CollectionReference <UserModel> userCollection =  getUserCollection();
    DocumentReference<UserModel>  userDocument = userCollection.doc(uid);
   return await userDocument.delete();
  }
}