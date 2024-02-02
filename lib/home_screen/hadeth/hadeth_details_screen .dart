import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/home_screen/hadeth/hadeth_tab.dart';
import 'package:islami/home_screen/hadeth/item_hadeth%20_details%20.dart';
import 'package:islami/home_screen/quran/item_sura%20_details.dart';
import 'package:islami/them.dart';
// عرض كل السور

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = ' Hadeth Details Screen';

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;

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
            '${args.title}',
            style: Theme.of(context).textTheme.titleLarge,
          )),
          
          body: Container(
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
            child: ListView.builder(
              
              itemCount: args.content.length,
              itemBuilder: (context, index) {
                return ItemHadethDetails(content: args.content[index]);
              },
            ),
          ),
        ),
      ],
    );
  }
}
