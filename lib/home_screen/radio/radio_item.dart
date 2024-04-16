// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:islami/home_screen/radio/cubit/radio_cubit.dart';
import 'package:islami/home_screen/radio/radio_widget.dart';
import 'package:islami/model/radio_response.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/theme.dart';

class RadioItem extends StatefulWidget {
  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  @override
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var cubit = BlocProvider.of<RadioCubit>(context);
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage("assets/images/radio_image.png")),
            SizedBox(
              height: 60,
            ),
            Text(
              cubit.currentRadio?.name ?? '',
              style: Theme.of(context).textTheme.titleMedium,
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
                    onPressed: () async {
                      cubit.onPlay();
                    },
                    icon: Icon(
                      cubit.isPlay
                          ? Icons.pause_sharp
                          : Icons.play_arrow_rounded,
                      size: 40,
                      color: provider.isDark()
                          ? MyTheme.yellowColor
                          : MyTheme.primaryLightMode,
                    )),
                IconButton(
                    onPressed: () async {
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
