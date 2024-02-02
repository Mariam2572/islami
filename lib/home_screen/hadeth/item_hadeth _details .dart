import 'package:flutter/material.dart';
import 'package:islami/home_screen/quran/sura_details_screen.dart';
// تفاصيل نص السورة

class ItemHadethDetails extends StatelessWidget {
  
  String content;
  ItemHadethDetails({required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
     content ,
      textDirection: TextDirection.rtl,
      style: Theme.of(context).textTheme.titleSmall,
    );
  }
}
