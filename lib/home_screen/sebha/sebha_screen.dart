import 'package:flutter/material.dart';
import 'package:islami/them.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  String text = 'سبحان الله';
  double turns = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                Image.asset('assets/images/head_sebha_logo.png'),
                AnimatedRotation(
                  duration: Duration(seconds: 1),
                  turns: turns,
                  child: InkWell(
                      onTap: () {
                        turns += 1 / 45;
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
                ),
              ],
            ),
          ),
          Text(
            'عدد التسبيحات',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 223, 195, 154),
                borderRadius: BorderRadius.circular(15)),
            child: Text(
              '$counter',
              style: TextStyle(fontSize: 25, color: MyTheme.blackColor),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: MyTheme.primaryLightMode,
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              text,
              style: TextStyle(fontSize: 25, color: MyTheme.colorWhite),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
             
              backgroundColor: MaterialStatePropertyAll(MyTheme.colorWhite)
            ),
              onPressed: () {
                counter = 0;
                text = 'سبحان الله';
                setState(() {});
              },
              child: Text('إعادة',
              style: TextStyle(color: MyTheme.primaryLightMode,
              fontSize: 25
              ),
              ))
        ],
      ),
    );
  }
}
