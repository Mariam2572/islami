import 'package:flutter/material.dart';
import 'package:islami/theme.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/radio_image.png'),
          Text(
            'إذاعة القرآن الكريم',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Padding(
            padding:  EdgeInsets.symmetric( vertical: MediaQuery.of(context).size.height*.05,
            horizontal: MediaQuery.of(context).size.height*.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ImageIcon( 
                color: MyTheme.primaryLightMode,
                  AssetImage('assets/images/Icon metro-next.png')),
                  ImageIcon( 
                color: MyTheme.primaryLightMode,
                  AssetImage('assets/images/Icon awesome-play.png')),
                  ImageIcon( 
                color: MyTheme.primaryLightMode,
                  AssetImage('assets/images/Icon right-next.png')),
              ],
            ),
          )
        ],
      ),
    );
  }
}