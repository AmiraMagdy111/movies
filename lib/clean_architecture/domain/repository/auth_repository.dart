import 'package:firebase_auth/firebase_auth.dart';

import '../../../model/user_model/user_model.dart';
abstract class AuthRepository{
   Future<UserCredential>register({required String name,
     required String email,
     required String password,
     required String phone,
     required String avatar,
  });
  Future<UserCredential>login({required String email, required String password,
  });
  Future<void>resetPassword({required String email
  });
  Future<UserCredential> signInWithGoogle();
   Future<void>addUser(UserModel user);
   Future<UserModel> getUser(String uid);
   Future<void> updateUser({required UserModel user});
   Future<void> deleteUser(String uid);

}