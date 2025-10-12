import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void setThemeMode(int mode) {
    switch (mode) {
      case 0:
        _themeMode = ThemeMode.system;
      case 1:
        _themeMode = ThemeMode.light;
      case 2:
        _themeMode = ThemeMode.dark;
    }
    notifyListeners();
  }
}
