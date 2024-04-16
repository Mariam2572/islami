
sealed class RadioState{}
class RadioLoadingState extends RadioState{}
class RadioErrorState extends RadioState {
  String  errorMessage;
  RadioErrorState({
   required this.errorMessage,
  });
}
class RadioSuccessState extends RadioState {

}
