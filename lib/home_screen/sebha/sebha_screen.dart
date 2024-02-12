import 'package:flutter/material.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

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
        var provider = Provider.of<AppConfigProvider>(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                    bottom: 200,
                    child:provider.isDark()?
                    Image.asset('assets/images/head_sebha_dark.png')
                    : Image.asset('assets/images/head_sebha_logo.png')),
                InkWell(
                    onTap: () {
                        turns += 1 / 45;
                        setState(() {
                          counter++;
                          if (counter == 33) {
                            text = 'الحمد لله';
                           
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
                  child: AnimatedRotation(
                    duration: Duration(seconds: 1),
                    turns: turns,
                    child: 
                        provider.isDark()?
                        Image.asset('assets/images/body_sebha_dark.png')
                        : Image.asset('assets/images/body_sebha_logo.png')),
                ),
                
              ],
            ),
          ),
          Text(
            AppLocalizations.of(context)!.num_of_tasbihs,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: provider.isDark()?
                MyTheme.colorYellow
                :
                 Color.fromARGB(255, 223, 195, 154),
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
                color:provider.isDark()?MyTheme.colorYellow
                :
                 MyTheme.primaryLightMode,
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              text,
              style: TextStyle(fontSize: 25, color:
              provider.isDark()?MyTheme.blackColor
              : MyTheme.colorWhite),
            ),
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(MyTheme.colorWhite)),
              onPressed: () {
                counter = 0;
                text = 'سبحان الله';
                setState(() {});
              },
              child: Text(
                AppLocalizations.of(context)!.restart,
                style: TextStyle(color:
                provider.isDark()?MyTheme.primaryDarkMode
                : MyTheme.primaryLightMode, fontSize: 25),
              ))
        ],
      ),
    );
  }
}
