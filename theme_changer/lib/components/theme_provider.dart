import 'package:flutter/material.dart';
import 'package:theme_changer/components/theme.dart';
class ThemeChanger with ChangeNotifier{
  ThemeData _themeData=lightMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData){
    _themeData=themeData;
    notifyListeners();
  }
  void toggleTheme(){
    if(_themeData==lightMode){
      themeData=darkMode;
    }else{
      themeData=lightMode;
    }
  }
}