import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier{
  String appLanguage = 'ar';
  ThemeMode appTheme =ThemeMode.light;
 Future<void> changeLanguage(String newLanguage) async {
    if (appLanguage == newLanguage) {
      return;
    }
    appLanguage = newLanguage;
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('lang', appLanguage);
    notifyListeners();
  }

 Future<void> changeTheme(ThemeMode newTheme) async {
    if (appTheme == newTheme) {
      return;
    }
    appTheme = newTheme;
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("mode", appTheme.name);
    notifyListeners();
  }
  Future <void> loadingSettings() async {
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String? mode = sharedPreferences.getString("mode");
  String? lang = sharedPreferences.getString("lang");
  mode ??= "light";
 appTheme  = (mode== "dark"? ThemeMode.dark : ThemeMode.light );
 lang ??= 'ar' ; 
 appLanguage = lang;
}
 

  bool isDark(){
    return appTheme ==ThemeMode.dark;
  }
}