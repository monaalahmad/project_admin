import 'package:flutter/material.dart';
import 'package:project_admin/theme/theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _currentTheme = lightMode;

  ThemeData get currentTheme => _currentTheme;

  set currentTheme(ThemeData themeData){
    _currentTheme = themeData;
    notifyListeners();
  }

  void toggleTheme(){
    if(_currentTheme == lightMode){
      currentTheme = darkMode;
    }else {
      currentTheme = lightMode;
    }
  }
}