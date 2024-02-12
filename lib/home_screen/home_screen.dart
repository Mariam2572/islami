import 'package:flutter/material.dart';
import 'package:islami/home_screen/hadeth/hadeth_tab.dart';
import 'package:islami/home_screen/quran/quran_tab.dart';
import 'package:islami/home_screen/radio/radio.dart';
import 'package:islami/home_screen/sebha/sebha_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/home_screen/settings/settings_tab.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex= 0;
 List<Widget>tabs= [
    QuranTab(), HadethTab(), SebhaTab(), RadioTab(),SettingsTab()
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/background.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          body: tabs[selectedIndex],
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.app_title,
            style: Theme.of(context).textTheme.titleLarge,
            )
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: Theme.of(context).primaryColor),
            child: BottomNavigationBar(
              currentIndex: selectedIndex ,
              onTap: (index) {
                selectedIndex = index;
                setState(() {
                  
                });
              },
              items:  [
              BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/icon_quran.png')),
               label: AppLocalizations.of(context)!.quran),
              BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/icon_hadeth.png')),
               label:AppLocalizations.of(context)!.hadeth),
              BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/icon_sebha.png')) , 
              label:AppLocalizations.of(context)!.sebha),
              BottomNavigationBarItem(icon:ImageIcon(AssetImage('assets/images/icon_radio.png')),
               label: AppLocalizations.of(context)!.radio),
              BottomNavigationBarItem(icon:Icon(Icons.settings),
               label: AppLocalizations.of(context)!.settings),
           
            ]),
          ),
        )
      ],
    );
  }
 
}

