



import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/auth_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit( {required this.authRepository}) :super(AuthInitial());
  AuthRepository authRepository;
  Future<void> register({required String email, required String password,
  }) async {
    emit(RegisterLoading());
    try {
      await authRepository.register(
        email: email,
        password: password,
      );
      emit(RegisterSuccess());
    } catch (exception) {
      emit(RegisterError(message: exception.toString()));
    }
  }
}
abstract class AuthState {}
class AuthInitial extends AuthState{}
  class RegisterLoading extends AuthState{}
class RegisterSuccess extends AuthState{}
class RegisterError extends AuthState{
  final String message;
  RegisterError({required this.message});
}
