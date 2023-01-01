import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:second_viva_app/dio.dart';

class auth extends ChangeNotifier {
  bool isLoggedIn = false;
  bool get authentificated => isLoggedIn;
  void login(Map creds) async {
    print(creds);
    Dio.Response response = await dio().post('/sanctum/token', data: creds);
    print('response.data.toString()');
    isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    isLoggedIn = false;
    notifyListeners();
  }
}
