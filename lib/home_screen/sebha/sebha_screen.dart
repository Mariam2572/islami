import 'package:flutter/material.dart';
import 'package:islami/them.dart';

class SebhaTab extends StatefulWidget {
@override
State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
int counter = 0;
String text = 'سبحان الله';
@override
Widget build(BuildContext context) {
//changeText(text);
return Scaffold(
body: Column(
children: [
Center(
child: Column(
  children: [
    Image.asset('assets/images/head_sebha_logo.png'),
    InkWell(
        onTap: () {
          setState(() {
            counter++;
            if (counter == 33) {
              text = 'الحمد لله';
              //counter=0;
            }
            if (counter == 66) {
              text = 'الله أكبر';
            }
            if (counter > 99) {
              counter = 0;
              text = 'سبحان الله';
            }
          });
        },
        child: Image.asset('assets/images/body_sebha_logo.png')),
  ],
),
),
Text(
'عدد التسبيحات',
style: Theme.of(context).textTheme.titleLarge,
),
Container(
decoration: BoxDecoration(
    color: Color.fromARGB(255, 223, 195, 154),
    borderRadius: BorderRadius.circular(25)),
child: Text(
  '$counter',
  style: TextStyle(fontSize: 25, color: MyTheme.blackColor),
),
),
Container(
decoration: BoxDecoration(
    color: MyTheme.primaryLightMode,
    borderRadius: BorderRadius.circular(25)),
child: Text(
  text,
  style: TextStyle(fontSize: 25, color: MyTheme.colorWhite),
),
),
ElevatedButton(
  onPressed: () {
    counter = 0;
    text = 'سبحان الله';
    setState(() {});
  },
  child: Text('إعادة'))
],
),
);
}
}
