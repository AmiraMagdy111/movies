
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'auth_remote_data_source.dart';
class AuthFirebaseRemoteDataSource implements AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<UserCredential> register(
      { required String email, required String password}) async {
    UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  @override
  Future<UserCredential> login(
      {required String email, required String password}) async {
    UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  @override
  Future<void> resetPassword({required String email}) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  @override
  Future<UserCredential> signInWithGoogle() async {
    await _googleSignIn.initialize(
        serverClientId: "266835740710-tv1g37pjc9u5nueokih3ca64i0eic9bq.apps.googleusercontent.com"
    );
    final GoogleSignInAccount result = await _googleSignIn.authenticate();
    final googleAuth = result.authentication;
    final credentials = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken
    );
    return await _firebaseAuth.signInWithCredential(credentials);
  }
}
