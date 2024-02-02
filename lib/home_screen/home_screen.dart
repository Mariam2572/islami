import 'package:flutter/material.dart';
import 'package:islami/home_screen/hadeth/hadeth_tab.dart';
import 'package:islami/home_screen/quran/quran_tab.dart';
import 'package:islami/home_screen/radio/radio.dart';
import 'package:islami/home_screen/sebha/sebha_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex= 0;
 List<Widget>tabs= [
    QuranTab(), HadethTab(), SebhaTab(), RadioTab()
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
            title: Text('إسلامي',
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
              items: const [
              BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/icon_quran.png')), label:'قرآن' ),
              BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/icon_hadeth.png')), label: 'حديث'),
              BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/icon_sebha.png')) , label: "تسبيح"),
              BottomNavigationBarItem(icon:ImageIcon(AssetImage('assets/images/icon_radio.png')), label: "الراديو"),
           
            ]),
          ),
        )
      ],
    );
  }
 
}

