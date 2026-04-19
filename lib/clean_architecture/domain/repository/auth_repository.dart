import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/errors/failure.dart';
import '../../../model/user_model/user_model.dart';
abstract class AuthRepository{
  Future<Either<Failure,UserCredential>>register({required String name,
     required String email,
     required String password,
     required String phone,
     required String avatar,
  });
  Future<Either<Failure,UserCredential>>login({required String email, required String password,
  });

  Future<void>resetPassword({required String email
  });
  Future<UserCredential> signInWithGoogle();
   Future<void>addUser(UserModel user);
   Future<UserModel> getUser(String uid);
   Future<void> updateUser({required UserModel user});
   Future<void> deleteUser(String uid);

}