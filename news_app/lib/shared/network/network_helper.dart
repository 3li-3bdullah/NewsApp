import 'package:dio/dio.dart';

class NetworkHelper {
  static late Dio dio;

  static initData(){
    dio = Dio(BaseOptions(
      baseUrl : "https://newsapi.org/",
      receiveDataWhenStatusError: true
    ));
  }

  static Future<Response> getData({required String url, required Map<String,dynamic> query}) async {
   return await dio.get(url, queryParameters:query);
  }


}