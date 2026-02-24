import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  static late SharedPreferences sharedPrefs;

  static Future<void> init() async {
    sharedPrefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveOnboarding() async {
    await sharedPrefs.setBool("isOnboardingDone", true);
  }
  static bool getOnboarding() {
    return sharedPrefs.getBool("isOnboardingDone") ?? false;
  }
}

