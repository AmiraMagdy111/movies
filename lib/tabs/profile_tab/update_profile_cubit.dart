
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/tabs/profile_tab/update_profile_states.dart';
import '../../clean_architecture/domain/repository/auth_repository.dart';
import 'package:movies/model/user_model/user_model.dart';
class UpdateProfileCubit extends Cubit<UpdateProfileStates> {
  final AuthRepository authRepository;
  UpdateProfileCubit(this.authRepository) : super(UpdateProfileInitial());
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String selectedAvatar = 'assets/profileImages/image 1.png';
  UserModel? userModel;
  //get userModel => null;
  Future<void> getUserData() async {
    emit(GetUserLoading());

    try {
      final firebaseUser = FirebaseAuth.instance.currentUser;
      if (firebaseUser == null) throw Exception("User not logged in");

      final user = await authRepository.getUser(firebaseUser.uid);

       nameController.text = user.name ?? "" ;
       phoneController.text = user.phone ?? "";
      selectedAvatar = user.profileImage ?? "";

      userModel = user;

      emit(GetUserSuccess());
    } catch (e) {
      emit(UpdateProfileError(e.toString()));
    }
  }
  Future<void> updateProfile() async {
    emit(UpdateProfileLoading());
    try {
      if (userModel == null) throw Exception("User data not loaded");

      final updatedUser = userModel!.copyWith(
        name: nameController.text.trim(),
        phone: phoneController.text.trim(),
        profileImage: selectedAvatar,
      );
      await authRepository.updateUser(user: updatedUser);
      emit(UpdateProfileSuccess());
    } catch (e) {
      emit(UpdateProfileError(e.toString()));
    }
  }

  Future<void> deleteAccount() async {
    emit(UpdateProfileLoading());
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) throw Exception("User not logged in");
      String uid = user.uid;
      await authRepository.deleteUser(uid);
      await user.delete();
      emit(DeleteAccountSuccess());
    } catch (e) {
      emit(UpdateProfileError(e.toString()));
    }
  }
}