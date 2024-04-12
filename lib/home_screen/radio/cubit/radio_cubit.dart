import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:islami/Api/api_manager.dart';
import 'package:islami/home_screen/radio/cubit/states.dart';
import 'package:islami/model/radio_response.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
class RadioCubit extends Cubit<RadioState>{
  List<Radios> radio=[];
  Radios ?currentRadio;
  int _currentIndex =0;
   AudioPlayer player = AudioPlayer();
  RadioCubit():super(RadioLoadingState()){
    getRadio();
  }
  final ApiManager apiManager = ApiManager();
void  getRadio() async {
      
    try {
      emit(RadioLoadingState());
     var response = await ApiManager.getRadio();
      radio = response?.radios??[];
      currentRadio =radio[_currentIndex];
      emit(RadioSuccessState());

    } on Exception catch (e) {
      print(e.toString());
    emit(RadioErrorState(errorMessage: e.toString()));
    }
  }
  PreviousRadio(){
    if (_currentIndex==0)return;
        player.stop();
    _currentIndex--;
    currentRadio =radio[_currentIndex];
    emit(RadioSuccessState());
  }
  NextRadio(){
    if(_currentIndex == radio.length-1) return;
    player.stop();
    _currentIndex++;
    currentRadio = radio[_currentIndex];
    emit(RadioSuccessState());
  }

}