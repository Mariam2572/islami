import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:islami/model/radio_response.dart';
class ApiManager{
  static Future <RadioResponse?> getRadio() async {
  try {
  var url = Uri.parse('https://mp3quran.net/api/v3/radios');
  var response = await http.get(url);
  var json=  jsonDecode(response.body);
  return RadioResponse.fromJson(json);
} on Exception catch (e) {
  print(e.toString());
  // TODO
}
} 
}
