import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository{
  Future<void> register({required String email, required String password,
  });
  Future<void> login({required String email, required String password,
  });
  Future<void>resetPassword({required String email
  });
  Future<UserCredential> signInWithGoogle();
}