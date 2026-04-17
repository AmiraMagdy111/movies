abstract class UpdateProfileStates {}
class UpdateProfileInitial extends UpdateProfileStates {}
class UpdateProfileLoading extends UpdateProfileStates {}
class UpdateProfileSuccess extends UpdateProfileStates {}
class UpdateProfileError extends UpdateProfileStates {
  final String message;
  UpdateProfileError(this.message);
}
class GetUserSuccess extends UpdateProfileStates {}
class GetUserLoading extends UpdateProfileStates {}
class DeleteAccountSuccess extends UpdateProfileStates {}
