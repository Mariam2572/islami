import 'package:flutter/material.dart';

class MyTheme {
  static Color blackColor = const Color(0xff242424);
  static Color primaryLightMode = const Color(0xffB7935F);
  static Color primaryDarkMode = const Color(0xff141A2E);
  static Color colorWhite = const Color(0xfffffffff);
  static Color colorYellow = const Color(0xffFACC1D);
  static Color lightColor = Color.fromARGB(255, 223, 195, 154);

  static ThemeData lightMode = ThemeData(
      primaryColor: primaryLightMode,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: blackColor),
      ),
      textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 25,
          ),
          titleSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: blackColor,
        showUnselectedLabels: true,
      ));
    static ThemeData darkMode = ThemeData(
      primaryColor: primaryDarkMode,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: colorWhite),
      ),
      textTheme:  TextTheme(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: colorWhite
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 25,
            color: colorWhite
          ),
          titleSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w400,
          color: colorWhite)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: colorYellow,
        showUnselectedLabels: true,
      ));
      
}// 
