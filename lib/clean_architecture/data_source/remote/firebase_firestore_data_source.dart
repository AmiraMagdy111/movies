import '../../../model/user_model/user_model.dart';

  abstract class FirebaseFirestoreDataSource {
  Future<void> addUserToFireStore({required UserModel user});
  Future<UserModel> getUserFromFireStore({ required String uid});
  Future<void> updateUserInFireStore({required UserModel user});
  Future<void> deleteUserFromFireStore ({ required String uid});
  }
