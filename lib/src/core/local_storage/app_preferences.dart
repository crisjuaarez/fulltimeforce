import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static late SharedPreferences _preferences;

  static Future<void> initialize() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static const _isDarkKey = 'isDarkMode';
  static const _firstTimeKey = 'firstTime';

  static Future<bool> setIsDarkMode(bool value) async {
    return await _preferences.setBool(_isDarkKey, value);
  }

  static bool getIsDarkMode() => _preferences.getBool(_isDarkKey) ?? false;

  static Future<bool> setFirstTime(bool value) async {
    return await _preferences.setBool(_firstTimeKey, value);
  }

  static bool getFirstTime() => _preferences.getBool(_firstTimeKey) ?? true;
}
