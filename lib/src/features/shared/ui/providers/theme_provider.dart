import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;

  void toggleTheme({bool? value}) {
    (value != null) ? _isDark = value : _isDark = !_isDark;
    notifyListeners();
  }
}
