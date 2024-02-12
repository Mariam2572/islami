import 'package:flutter/material.dart';
import 'package:islami/home_screen/hadeth/hadeth_details_screen%20.dart';
import 'package:islami/home_screen/home_screen.dart';
import 'package:islami/home_screen/quran/sura_details_screen.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => AppConfigProvider(),
    child: IslamiApp()));
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName :(context) => SuraDetailsScreen(),
       HadethDetailsScreen.routeName :(context) => HadethDetailsScreen()
      },
       theme: MyTheme.lightMode,
       themeMode: provider.appTheme,
       darkTheme: MyTheme.darkMode,
       locale: Locale(provider.appLanguage),
         localizationsDelegates: AppLocalizations.localizationsDelegates,
         supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
