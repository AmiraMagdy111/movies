
import '../data_source/remote/auth_remote_data_source.dart';
import 'auth_repository.dart';
class AuthRepositoryImplementation implements AuthRepository{
  final AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImplementation({required this.remoteDataSource});
  @override
  Future<void> register({required String email,required String password,
  }) async {
    await remoteDataSource.register(
      email: email,
      password: password,
    );
  }
}