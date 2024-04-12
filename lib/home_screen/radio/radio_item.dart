// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:islami/home_screen/radio/cubit/radio_cubit.dart';
import 'package:islami/model/radio_response.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/theme.dart';
import 'package:provider/provider.dart';

class RadioItem extends StatefulWidget {
 
  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {

 
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
   var cubit = BlocProvider.of<RadioCubit>(context);
  // RadioCubit cubit = RadioCubit();
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child:
        Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Image(image: AssetImage("assets/images/radio_image.png")),
        SizedBox(
          height: 60,
        ),
        Text(
          cubit.currentRadio!.name ?? "",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  cubit.PreviousRadio();
                },
                icon: Icon(
                  Icons.skip_previous_rounded,
                  size: 40,
                  color: provider.isDark()
                      ? MyTheme.yellowColor
                      : MyTheme.primaryLightMode,
                )),
            IconButton(
                onPressed: () {
                  cubit.onPlay();
                },
                icon: Icon(
                  cubit.isPlay ? Icons.pause_sharp : Icons.play_arrow_rounded,
                  size: 40,
                  color: provider.isDark()
                      ? MyTheme.yellowColor
                      : MyTheme.primaryLightMode,
                )),
            IconButton(
                onPressed: () {
                  cubit.NextRadio();
                },
                icon: Icon(
                  Icons.skip_next_rounded,
                  size: 40,
                  color: provider.isDark()
                      ? MyTheme.yellowColor
                      : MyTheme.primaryLightMode,
                )),
          ],
        )
      ],
        ));
  }
}
