import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'update_profile_states.dart';
import 'package:movies/models/user_model.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileStates> {
  UpdateProfileCubit() : super(UpdateProfileInitial());

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String selectedAvatar = 'assets/profileImages/image 1.png';

  get userModel => null;

  Future<void> getUserData() async {
    emit(GetUserLoading());
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      var document = await FirebaseFirestore.instance.collection('users').doc(uid).get();

      if (document.exists) {
        UserModel user = UserModel.fromJson(document.data()!);

        nameController.text = user.name ?? '';
        phoneController.text = user.phone ?? '';
        selectedAvatar = user.profileImage ?? 'assets/profileImages/image 1.png';

        emit(GetUserSuccess());
      } else {
        emit(UpdateProfileError("User not found"));
      }
    } catch (e) {
      emit(UpdateProfileError(e.toString()));
    }
  }

  Future<void> updateProfile() async {
    emit(UpdateProfileLoading());
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;

      await FirebaseFirestore.instance.collection('users').doc(uid).update({
        'name': nameController.text,
        'phone': phoneController.text,
        'profileImage': selectedAvatar,
      });

      emit(UpdateProfileSuccess());
    } catch (e) {
      emit(UpdateProfileError(e.toString()));
    }
  }

  Future<void> deleteAccount() async {
    emit(UpdateProfileLoading());
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance.collection('users').doc(uid).delete();

      await FirebaseAuth.instance.currentUser!.delete();

      emit(DeleteAccountSuccess());
    } catch (e) {
      emit(UpdateProfileError(e.toString()));
    }
  }
}