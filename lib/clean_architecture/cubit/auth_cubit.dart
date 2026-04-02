import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/auth_repository.dart';
class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepository}) : super(AuthInitial());
  final AuthRepository authRepository;

  Future<void> register({
    required String email,
    required String password,
  }) async {
    emit(RegisterLoading());
    try {
      await authRepository.register(
        email: email,
        password: password,
      );
      emit(RegisterSuccess());
    } catch (exception) {
      emit(AuthError(exception.toString()));
    }
  }

  Future<void> login({required String email, required String password,}) async {
    emit(LoginLoading());
    try {
      await authRepository.login(
        email: email,
        password: password,
      );
      emit(LoginSuccess());
    } catch (exception) {
      emit(AuthError(exception.toString()));
    }
  }


  Future<void> resetPassword({required String email}) async {
    emit(ResetPasswordLoading());
    try {
      await authRepository.resetPassword(email: email);
      emit(ResetPasswordSuccess());
    } catch (exception) {
      emit(AuthError(exception.toString()));
    }
  }
  Future<void> signInWithGoogle() async {
    emit(GoogleSignInLoading());
    try {
      await authRepository.signInWithGoogle();
      emit(GoogleSignInSuccess());
    } catch (exception) {
      emit(AuthError(exception.toString()));
    }
  }
}

abstract class AuthState {}

class AuthInitial extends AuthState {}

class RegisterLoading extends AuthState {}
class RegisterSuccess extends AuthState {}

class LoginLoading extends AuthState {}
class LoginSuccess extends AuthState {}

class ResetPasswordLoading extends AuthState {}
class ResetPasswordSuccess extends AuthState {}

class GoogleSignInLoading extends AuthState {}
class GoogleSignInSuccess extends AuthState {}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}