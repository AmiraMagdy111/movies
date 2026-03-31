
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_remote_data_source.dart';
class AuthFirebaseRemoteDataSource implements AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<void> register({required String email, required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> login({required String email, required String password}) async{
   await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }
}