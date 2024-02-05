import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/home_screen/quran/item_sura%20_details.dart';
import 'package:islami/them.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = ' Sura Details Screen';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (verses.isEmpty) {
      loadFile(args.fileIndex);
    }

    return Stack(
      children: [
        Image.asset(
          'assets/images/background.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
              title: Text(
            '${args.name}',
            style: Theme.of(context).textTheme.titleLarge,
          )),
          body: verses.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                    color: MyTheme.primaryLightMode,
                  ),
                )
              : Container(
                  margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.06,
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  decoration: BoxDecoration(
                    color: MyTheme.colorWhite,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
              thickness: 2,
              color: Theme.of(context).primaryColor,
            ),
                    itemCount: verses.length,
                    itemBuilder: (context, index) {
                      return ItemSuraDetails(name: verses[index], index: index,);
                    },
                  ),
                ),
        ),
      ],
    );
  }

  void loadFile(int fileIndex) async {
    String content =
        await rootBundle.loadString('assets/files/${fileIndex + 1}.txt');
    List<String> lines = content.split('\n');
    verses = lines;
    // for (var i = 0; i < lines.length; i++) {
    //   print(lines[i]);
    // }
    setState(() {});
  }
}

class SuraDetailsArgs {
  String name;
  int fileIndex;
  SuraDetailsArgs({required this.name, required this.fileIndex});
}
