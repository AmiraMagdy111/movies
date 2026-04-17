
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemoteDataSource {
    Future<UserCredential>register({required String email,required String password,
    });
   Future<UserCredential>login({required String email , required String password});
   Future<void>resetPassword({required String email});
   Future<void> signInWithGoogle();
}
