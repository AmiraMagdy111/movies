
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import '../../../core/errors/app_exception.dart';
import 'auth_remote_data_source.dart';
@LazySingleton(as: AuthRemoteDataSource)
class AuthFirebaseRemoteDataSource implements AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<UserCredential> register(
      { required String email, required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } catch (exception) {
      if (exception is FirebaseAuthException) {
        if (exception.code == 'weak-password') {
          throw RemoteException(message: "Weak password");
        } else if (exception.code == 'email-already-in-use') {
          throw RemoteException(
            message: "The account already exists for that email.",
          );
        // } else {
        //   throw RemoteException(
        //     message: exception.message ?? "Error",
        //   );
        }
      }
    }
    throw RemoteException(message: "Something went wrong");
  }

  @override
  Future<UserCredential> login(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } catch (exception) {
      if (exception is FirebaseAuthException) {
        if (exception.code == 'invalid-credential') {
          throw RemoteException(
            message: "incorrect email or password",
          );
        }
      }
      throw RemoteException(message:"Failed to login !");
    }
  }


  @override
  Future<void> resetPassword({required String email}) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  @override
  Future<UserCredential> signInWithGoogle() async {
    try {
      await _googleSignIn.initialize(
          serverClientId: "266835740710-tv1g37pjc9u5nueokih3ca64i0eic9bq.apps.googleusercontent.com"
      );
      final GoogleSignInAccount result = await _googleSignIn.authenticate();
      final googleAuth = result.authentication;
      final credentials = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken
      );
      return await _firebaseAuth.signInWithCredential(credentials);

    } catch (exception) {
      String? message;
      if (exception is FirebaseAuthException) {
        message = exception.message;
      }
      throw RemoteException(message: message ?? "Failed to login !");
    }
  }
}
