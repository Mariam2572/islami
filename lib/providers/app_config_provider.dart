import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier{
  String appLanguage = 'ar';
  ThemeMode appTheme =ThemeMode.light;
  void changeTheme(ThemeMode newThem){
    if (appTheme== newThem) {
      return;
    } appTheme=newThem;
    notifyListeners();
  }
  
  void changeLanguage(String newLanguage ){

    if (newLanguage == appLanguage) {
      return;
    }
    appLanguage =newLanguage;
    notifyListeners();
  }
bool isDark(){
    return appTheme ==ThemeMode.dark;
  }
}