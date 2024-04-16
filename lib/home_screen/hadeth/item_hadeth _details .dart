import 'package:flutter/material.dart';
//import 'package:islami/home_screen/quran/sura_details_screen.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/theme.dart';
import 'package:provider/provider.dart';
// تفاصيل نص السورة

class ItemHadethDetails extends StatelessWidget {
  
  String content;
  ItemHadethDetails({required this.content});

  @override
  Widget build(BuildContext context) {
            var provider =Provider.of<AppConfigProvider>(context);

    return Text(
     content ,
      textDirection: TextDirection.rtl,
      style: Theme.of(context).textTheme.titleSmall!.copyWith(
        color: provider.isDark() ? MyTheme.colorWhite :
        MyTheme.blackColor),
    );
  }
}
