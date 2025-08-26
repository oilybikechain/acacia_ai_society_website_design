import 'package:website/themes/theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  late ThemeData _themeData;

  ThemeProvider() {
    _themeData = darkMode;
  }

  ThemeData get themeData => _themeData;

  void toggleTheme() {
    ThemeData newTheme;
    if (_themeData == lightMode) {
      newTheme = darkMode;
    } else {
      newTheme = lightMode;
    }
    _themeData = newTheme;
    notifyListeners();
  }
}
