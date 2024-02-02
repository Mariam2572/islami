import 'package:flutter/material.dart';
import 'package:islami/home_screen/hadeth/hadeth_tab.dart';
import 'package:islami/home_screen/hadeth/hadeth_details_screen%20.dart';
import 'package:islami/home_screen/quran/sura_details_screen.dart';
// الضغط على اسم كل سورة
class ItemHadethName extends StatelessWidget {
  Hadeth hadeth;
  
  ItemHadethName({required this.hadeth});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadethDetailsScreen.routeName,
        arguments: hadeth    );
      },
      child: Text(
        hadeth.title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
