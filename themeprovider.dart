// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'light_mode.dart';
//
// class Themeprovider extends ChangeNotifier{
//   ThemeData _themeData = lightMode;
//   ThemeData get themeData = _themeData;
//   bool get isDarkMode => _themeData == darkMode;
//
//
// }


import 'package:flutter/material.dart';

import 'dark_mode.dart';
import 'light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  final ThemeData _themeData = lightMode;

  ThemeData get getTheme => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData themeData) {
    themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if(_themeData == lightMode){
      themeData = darkMode;
    }else {
      themeData = lightMode;
    }
  }
}