import 'package:flutter/material.dart';
import 'package:islami/home_screen/hadeth/hadeth_details_screen%20.dart';
import 'package:islami/home_screen/home_screen.dart';
import 'package:islami/home_screen/quran/sura_details_screen.dart';
import 'package:islami/them.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName :(context) => SuraDetailsScreen(),
       HadethDetailsScreen.routeName:(context) => HadethDetailsScreen()
      },
       theme: MyTheme.lightMode,
    );
  }
}
