import 'package:flutter/material.dart';
import 'package:islami/home_screen/quran/sura_details_screen.dart';
class ItemSuraName extends StatelessWidget {
  String name;
  int fileIndex;
  ItemSuraName({required this.name, required this.fileIndex});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SuraDetailsScreen.routeName,
            arguments: SuraDetailsArgs(name: name, fileIndex: fileIndex));
      },
      child: Text(
        name,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
