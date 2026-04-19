
abstract class AuthLocalDataSource {
  Future<void> saveLoginUser( String login);
  Future<String?>getLoginUser();

}
