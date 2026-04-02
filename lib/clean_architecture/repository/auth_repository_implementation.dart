
import 'package:firebase_auth/firebase_auth.dart';

import '../data_source/remote/auth_remote_data_source.dart';
import 'auth_repository.dart';
class AuthRepositoryImplementation implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImplementation({required this.remoteDataSource});

  @override
  Future<void> register({required String email, required String password,
  }) async {
    await remoteDataSource.register(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> login({required String email, required String password}) async {
    await remoteDataSource.login(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> resetPassword({required String email,}) async {
    await remoteDataSource.resetPassword(email: email);
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    return await remoteDataSource.signInWithGoogle();
  }
}