import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/home_screen/hadeth/item_hadeth_name.dart';
import 'package:islami/them.dart';
class Hadeth {
  String title;
  List<String> content;
  Hadeth({required this.title ,required this.content});
}

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List <Hadeth> ahadethList=[];

  @override
  Widget build(BuildContext context) {
    if (ahadethList.isEmpty) {
      loadingHadeth();
    }
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Image.asset('assets/images/hadeth_logo.png'),
          ),
           Divider(
            thickness: 3,
            color: Theme.of(context).primaryColor,
          ),
         Text('اسم الحديث',
         style: Theme.of(context).textTheme.titleLarge,
         ),
         Divider(
            thickness: 3,
            color: Theme.of(context).primaryColor,
          ),
          ahadethList.isEmpty ?
          CircularProgressIndicator(
            color: MyTheme.primaryLightMode,
          )
          :
          Expanded(child: ListView.separated(itemBuilder: (context, index) {
            return ItemHadethName(hadeth:ahadethList[index]);
          } ,
             separatorBuilder: (context, index) => Divider(
              thickness: 2,
              color: Theme.of(context).primaryColor,
            ),
            itemCount: ahadethList.length))
        ],
      ),
    );
  }

  void loadingHadeth() async{
   String ahadethContent= await rootBundle.loadString('assets/files/ahadeth.txt');
   List<String> hadethList = ahadethContent.split('#\r\n');
   for (var i = 0; i < hadethList.length; i++) {
   List<String> ahadethLines= hadethList[i].split('\n');
   String title = ahadethLines[0];
   ahadethLines.removeAt(0);
   Hadeth hadeth =Hadeth(title: title, content: ahadethLines);
   ahadethList.add(hadeth);
   setState(() {
     
   });
   }
  }
}