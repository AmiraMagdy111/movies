import 'package:injectable/injectable.dart';
import 'package:movies/clean_architecture/data_source/local/auth_local_data_source.dart';
import 'package:movies/clean_architecture/data_source/local/cash_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/errors/app_exception.dart';
@Singleton(as: AuthLocalDataSource)
class AuthSharedPrefsLocalDataSource implements AuthLocalDataSource {
  static late SharedPreferences sharedPrefs;

  @override
  Future<void> saveLoginUser(String login) async {

    try {
      sharedPrefs = await SharedPreferences.getInstance();
      await sharedPrefs.setString(CashConstant.loginKey, login);
    } catch (exception) {
      throw LocalException(message: "failed to save user !");
    }
  }
  @override
  Future<String?> getLoginUser() async {
    try {
      sharedPrefs = await SharedPreferences.getInstance();
      return sharedPrefs.getString(CashConstant.loginKey);
    } catch (exception) {
      throw LocalException(message: "failed to get user !");
    }
  }
}