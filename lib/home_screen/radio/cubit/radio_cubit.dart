import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:islami/Api/api_manager.dart';
import 'package:islami/home_screen/radio/cubit/states.dart';
import 'package:islami/model/radio_response.dart';

class RadioCubit extends Cubit<RadioState> {
  List<Radios> radio = [];
  Radios? currentRadio;
  int _currentIndex = 0;
  AudioPlayer player = AudioPlayer();
  bool isPlay = false;
  final ApiServices apiServices = ApiServices();
 

  RadioCubit() : super(RadioLoadingState())
   {
  getRadio();
  }
  getRadio() async {
    try {
      emit(RadioLoadingState());
      var response = await apiServices.getRadio();
      var date=    RadioResponse.fromJson(response);
  radio= date.radios??[];
      currentRadio = radio[_currentIndex];
      emit(RadioSuccessState());
    } on Exception catch (e) {
      print(e.toString());
      emit(RadioErrorState(errorMessage: e.toString()));
    }
  }

  PreviousRadio() {
    if (_currentIndex == 0) return;
    player.stop();
    _currentIndex--;
    currentRadio = radio[_currentIndex];
    emit(RadioSuccessState());
  }

  NextRadio() {
    if (_currentIndex == radio.length - 1) return;
    player.stop();
    _currentIndex++;
    currentRadio = radio[_currentIndex];
    emit(RadioSuccessState());
  }
  onPlay() {
    if (player.state == PlayerState.playing) {
      isPlay = false;
      player.pause();

    } else if (player.state == PlayerState.paused) {
      isPlay = true;
      player.resume();
    } else {
      isPlay = true;
      player.play(UrlSource(currentRadio!.url!));
    }
    emit(RadioSuccessState());
  }
}
