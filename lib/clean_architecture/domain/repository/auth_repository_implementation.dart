
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/clean_architecture/data_source/local/auth_local_data_source.dart';
 import '../../../core/errors/app_exception.dart';
import '../../../core/errors/failure.dart';
import '../../../model/user_model/user_model.dart';
import '../../data_source/remote/auth_remote_data_source.dart';
 import '../../data_source/remote/firebase_firestore_data_source.dart';
import 'auth_repository.dart';
@LazySingleton(as:  AuthRepository)
 class AuthRepositoryImplementation implements AuthRepository {
   AuthRemoteDataSource remoteDataSource;
   AuthLocalDataSource localDataSource;
   final FirebaseFirestoreDataSource firestoreRemoteDataSource;
   AuthRepositoryImplementation({required this.remoteDataSource,
     required this.firestoreRemoteDataSource,
     required this.localDataSource
   });
   @override
   Future<Either<Failure,UserCredential>>register(
       {required String name ,
         required String email,
         required String password,
         required String phone,
         required String avatar
       }) async {
     try{
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
     await localDataSource.saveLoginUser(userCredential.user!.uid);

     return Right(userCredential);
     } on AppException catch (exception) {
       return Left(Failure(message: exception.message));
     }
   }


   @override
   Future<Either<Failure, UserCredential>> login(
       {required String email, required String password,}) async {
     try{
       final userCredential = await remoteDataSource.login(
         email: email,
         password: password,
       );
       final uid = userCredential.user?.uid;
       if (uid == null) {
         return Left(Failure(message: "User not found"));
       }
       await localDataSource.saveLoginUser(uid);
       return Right(userCredential);
     } on AppException catch (exception) {
       return left(Failure(message: exception.message));
     }
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

