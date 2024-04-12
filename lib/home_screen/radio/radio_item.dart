// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:islami/home_screen/radio/cubit/radio_cubit.dart';
import 'package:islami/model/radio_response.dart';
import 'package:islami/theme.dart';

class RadioItem extends StatefulWidget {
 
  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
 @override
 
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<RadioCubit>(context);
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Text(
            '${cubit.currentRadio?.name ?? ''}\n',
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * .05,
                horizontal: MediaQuery.of(context).size.height * .05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    cubit.PreviousRadio();
                    
               
                  },
                  child: ImageIcon(
                      color: MyTheme.primaryLightMode,
                      AssetImage('assets/images/Icon metro-next.png')),
                ),
                InkWell(
                  onTap: ()  async {

       await cubit.player.play(UrlSource(cubit.currentRadio?.url??''));
                  },
                  child: ImageIcon(
                    color: MyTheme.primaryLightMode,
                    AssetImage('assets/images/Icon awesome-play.png'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    cubit.NextRadio();
                    
                  },
                  child: ImageIcon(
                      color: MyTheme.primaryLightMode,
                      AssetImage('assets/images/Icon right-next.png')),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
