// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:islami/model/radio_response.dart';

sealed class RadioState{}
class RadioLoadingState extends RadioState{}
class RadioErrorState extends RadioState {
  String  errorMessage;
  RadioErrorState({
   required this.errorMessage,
  });
}
class RadioSuccessState extends RadioState {
  // List<Radios?> radio;
  // RadioSuccessState({
  //   required this.radio,
  // });
}
