import 'package:flutter/material.dart';
import 'package:fulltimeforce_app/src/core/local_storage/app_preferences.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;

  void init() {
    _isDark = AppPreferences.getIsDarkMode();
  }

  void toggleTheme({bool? value}) {
    (value != null) ? _isDark = value : _isDark = !_isDark;
    AppPreferences.setIsDarkMode(_isDark);
    notifyListeners();
  }
}
