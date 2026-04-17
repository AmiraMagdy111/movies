
import 'package:firebase_auth/firebase_auth.dart';
 import '../../../model/user_model/user_model.dart';
import '../../data_source/remote/auth_remote_data_source.dart';
 import '../../data_source/remote/firebase_firestore_data_source.dart';
import 'auth_repository.dart';
 class AuthRepositoryImplementation implements AuthRepository {
   final AuthRemoteDataSource remoteDataSource;
   final FirebaseFirestoreDataSource firestoreRemoteDataSource;

   AuthRepositoryImplementation({required this.remoteDataSource,required this.firestoreRemoteDataSource
   });
   @override
   Future<UserCredential> register(
       {required String name ,
         required String email,
         required String password,
         required String phone,
         required String avatar
       }) async {
     final userCredential = await remoteDataSource.register(
       email: email,
       password: password,
     );
     UserModel user = UserModel(
       id: userCredential.user!.uid,
       email: email,
       name: name,
       phone: phone,
       profileImage: avatar,
     );
     await firestoreRemoteDataSource.addUserToFireStore(user: user);

     return userCredential;
   }


   @override
   Future<UserCredential> login(
       {required String email, required String password,
       }) {
     return remoteDataSource.login(
       email: email,
       password: password,);
   }

   @override
   Future<void> resetPassword({required String email,}) async {
     await remoteDataSource.resetPassword(email: email);
   }

   @override
   Future<UserCredential> signInWithGoogle() {
     // TODO: implement signInWithGoogle
     throw UnimplementedError();
   }
   @override
   Future<void> addUser(UserModel user) {
     return firestoreRemoteDataSource.addUserToFireStore(user: user);
   }

   @override
   Future<UserModel> getUser(String uid) {
     return firestoreRemoteDataSource.getUserFromFireStore(uid: uid);
   }



  @override
  Future<void> updateUser({required UserModel user}) {
   return firestoreRemoteDataSource.updateUserInFireStore(user: user);
  }
   @override
   Future<void> deleteUser(String uid) {
    return firestoreRemoteDataSource.deleteUserFromFireStore(uid: uid);
   }
 }

