import 'package:movies/clean_architecture/data_source/local/auth_local_data_source.dart';
import 'package:movies/clean_architecture/data_source/local/cash_constant.dart';
import 'package:movies/model/user_model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthSharedPrefsLocalDataSource implements AuthLocalDataSource{
  // static late SharedPreferences sharedPrefs;
  // @override
  // Future<void> saveUser(UserModel user) async {
  //   sharedPrefs = await SharedPreferences.getInstance();
  //
  //   final userJson = jsonEncode(user.toJson());
  //
  //   await sharedPrefs.setString(CashConstant.userKey, userJson);
  // }
  //
  // @override
  // Future<UserModel> getUser() {
  //   // TODO: implement getUser
  //   throw UnimplementedError();
  // }

}