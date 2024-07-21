
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


  
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
