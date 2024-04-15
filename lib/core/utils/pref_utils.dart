
import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  PrefUtils() {
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  static SharedPreferences? _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    print('SharedPreference Initialized');
  }

  
  ///will clear all the data stored in preference
  static void clearPreferencesData() async {
    _sharedPreferences!.clear();
  }

  static Future<void> setThemeData({required bool themeValue}) {
    return _sharedPreferences!.setBool('themeData', themeValue);
    
  }

  static bool getThemeData() {
      return _sharedPreferences!.getBool('themeData')?? false;
  }
  static bool getBool({required String key}) {
      return _sharedPreferences!.getBool(key)?? false;
  }
  static Future<void> setBool({required String key,required bool value, }) {
    return  _sharedPreferences!.setBool(key, value);
  }

}
