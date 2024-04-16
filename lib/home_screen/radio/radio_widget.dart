// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/Api/api_manager.dart';
import 'package:islami/home_screen/radio/cubit/radio_cubit.dart';
import 'package:islami/home_screen/radio/cubit/states.dart';
import 'package:islami/home_screen/radio/radio_item.dart';
import 'package:islami/model/radio_response.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/theme.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatefulWidget {
  
  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
@override
late AudioPlayer audioPlayer;
 // List<Radios> radio = [];
  Radios? currentRadio;
  int currentIndex = 0;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioPlayer = AudioPlayer();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
     var provider = Provider.of<AppConfigProvider>(context);
       return  
        SafeArea(
      child: BlocProvider(
        create: (context) => RadioCubit()..getRadio(),
        child: BlocBuilder<RadioCubit, RadioState>(
          builder: (context, state) {
            switch (state) {
              case RadioLoadingState():
                return Center(
                    child: CircularProgressIndicator(
                        color: provider.isDark()
                            ? MyTheme.yellowColor
                            : MyTheme.primaryLightMode));
              case RadioSuccessState():
                return RadioItem();

              case RadioErrorState():
                return Text(state.errorMessage);
            }
          },
        ),
      ),
    );
     
  
     
   }
   
}
