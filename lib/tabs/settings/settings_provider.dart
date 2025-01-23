import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier
{
  ThemeMode themeMode = ThemeMode.light;

  void changeTheme(ThemeMode mode)
  {
    themeMode = mode;
    notifyListeners();
  }
}