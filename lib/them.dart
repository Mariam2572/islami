import 'package:flutter/material.dart';

class MyTheme {
  static Color blackColor = const Color(0xff242424);
  static Color primaryLightMode = const Color(0xffB7935F);
  static Color colorWhite = const Color(0xfffffffff);

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
            fontWeight: FontWeight.w400,
            fontSize: 25,
          ),
          titleSmall: TextStyle(fontSize: 25, fontWeight: FontWeight.w300)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: blackColor,
        showUnselectedLabels: true,
      ));
}// 
