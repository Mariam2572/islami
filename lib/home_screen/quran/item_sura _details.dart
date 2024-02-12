import 'package:flutter/material.dart';
import 'package:islami/home_screen/quran/sura_details_screen.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/theme.dart';
import 'package:provider/provider.dart';

class ItemSuraDetails extends StatelessWidget {
  String name;
  int index;
  ItemSuraDetails({required this.name , required this.index});

  @override
  Widget build(BuildContext context) {
            var provider =Provider.of<AppConfigProvider>(context);

    return Text(
      '$name {${index+1}}',
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
        color: provider.isDark() ? MyTheme.colorWhite :
        MyTheme.blackColor
      ),
    );
  }
}
