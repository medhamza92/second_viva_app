import 'package:dio/dio.dart';

Dio dio() {
  Dio dio = new Dio();
  dio.options.baseUrl = "http://192.168.43.31:8000/api";
  dio.options.headers['Accept'] = 'application/json';
  dio.options.followRedirects = false;
  return dio;
}

