import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../model/radio_response.dart';


  
class ApiServices{
  
  var _dio = Dio(
    BaseOptions(baseUrl:"https://mp3quran.net/api/v3")
  );
  ApiServices(){
    _dio.interceptors.add(PrettyDioLogger(
  
    ));
  }
   getRadio() async {
   var response= await _dio.get("/radios");
   return response.data;
  }
}
