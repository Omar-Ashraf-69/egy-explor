import 'package:egy_exlpor/core/utils/pref_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<bool> {
  bool _darkTheme = false;
  bool get getIsDarkTheme => _darkTheme;
  ThemeCubit() : super(false) {
    getTheme();
  }

  // Future<void> setDarkTheme({required bool themeValue}) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setBool(THEME_STATUS, themeValue);
  //   emit(themeValue);

  //   _darkTheme = themeValue;
  // }
  Future<void> setDarkTheme({required bool themeValue}) async {
    await PrefUtils.setThemeData(themeValue: themeValue);
    emit(themeValue);
    _darkTheme = themeValue;
  }

  // Future<bool> getTheme() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   _darkTheme = prefs.getBool(THEME_STATUS) ?? false;
  //   emit(_darkTheme);
  //   return _darkTheme;
  // }
  bool getTheme() {
    _darkTheme = PrefUtils.getThemeData();
    emit(_darkTheme);
    return _darkTheme;
  }
}
