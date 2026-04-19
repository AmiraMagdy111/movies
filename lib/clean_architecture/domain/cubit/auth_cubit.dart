
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../repository/auth_repository.dart';
@singleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepository}) : super(AuthInitial());
  final AuthRepository authRepository;
  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String avatar
  }) async {
    emit(AuthLoading());
    final result = await authRepository.register(
      name: name,
      email: email,
      password: password,
      phone: phone,
      avatar: avatar,
    );
    result.fold((failure) {
        emit(AuthError(failure.message));
      },
          (userCredential) {
        emit(AuthSuccess());
      },
    );
  }
  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());

    final result = await authRepository.login(
      email: email,
      password: password,
    );

    result.fold(
          (failure) {
        emit(AuthError(failure.message));
      },
          (_) {
        emit(AuthSuccess());
      },
    );
  }

  Future<void> resetPassword({required String email}) async {
    emit(AuthLoading());
    try {
      await authRepository.resetPassword(email: email);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> signInWithGoogle() async {
    emit(AuthLoading());
    try {
      final user = await authRepository.signInWithGoogle();
      // emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}


abstract class AuthState {}

class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class AuthSuccess  extends AuthState {}
class AuthError extends AuthState {
  final String message;
  AuthError(this.message);



}


// final firebaseUser = credential.user;
// if (firebaseUser == null) {
//   throw Exception("User is null");
// }
// final uid = firebaseUser.uid;
//final userModel = UserModel(
// uId: uid,
//  name: name,
//  phone: phone,
//  profileImage: avatar
// );
// await authRepository.addUser(userModel);
// emit(RegisterSuccess(userModel));





// final credential = await authRepository.login(
//   email: email,
//   password: password,
// final uid = credential.user!.uid;
// final userModel = await authRepository.getUser(uid);




// Future<void> login({
//   required String email,
//   required String password,
// }) async {
//   emit(AuthLoading());
//   try {
//     await authRepository.login(email: email, password: password);
//     emit(AuthSuccess());
//   }on FirebaseAuthException catch (exception) {
//     if (exception.code == 'invalid-credential') {
//       emit(AuthError("Invalid email or password "));
//     } else {
//       emit(AuthError(exception.message ?? "Error"));
//     }
//   } catch (exception) {
//     emit(AuthError(exception.toString()));
//   }
// }
// Future<void> resetPassword({required String email}) async {
//   emit(AuthLoading());
//   try {
//     await authRepository.resetPassword(email: email);
//     emit(AuthSuccess());
//   } catch (e) {
//     emit(AuthError(e.toString()));
//   }
// }
// Future<void> register({
//   required String name,
//   required String email,
//   required String password,
//   required String phone,
//   required String avatar
// }) async {
//   emit(AuthLoading());
//   try {
//     await authRepository.register(
//         name: name,
//         email: email,
//         password: password,
//         phone: phone,
//         avatar: avatar
//     );
//     emit(AuthSuccess());
//   } on FirebaseAuthException catch (exception) {
//     if(exception.code =='weak-password'){
//       emit(AuthError("Weak password"));
//     }else if (exception.code == 'email-already-in-use' ){
//       emit(AuthError("The account already exists for that email."));
//     } else {
//       emit(AuthError(exception.message ?? "Error"));
//     }
//     } catch (exception) {
//     emit(AuthError(exception.toString()));
//   }
// }