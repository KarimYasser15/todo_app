import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier
{
  ThemeMode themeMode = ThemeMode.light;
  String language = "en";

  void changeTheme(ThemeMode mode)
  {
    if(themeMode == mode) return;
    themeMode = mode;
    notifyListeners();
  }
  void changeLanguage(String newLanguage)
  {
    if(language == newLanguage) return;
    language = newLanguage;
    notifyListeners();
  }
}