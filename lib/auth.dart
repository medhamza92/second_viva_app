import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:second_viva_app/dio.dart';

class auth extends ChangeNotifier {
  bool isLoggedIn = false;
  bool get authentificated => isLoggedIn;
  void login(var creds) async {
    print(creds);
    var dio = Dio();
    var response =
        await dio.post('http://192.168.43.31:8000/api/sanctum/token',
            data: creds,
            options: Options(

                followRedirects: false,
                
                headers: {'Accept': 'application/json'}));
    print('cc ziin');
    print(response.data.toString());
    isLoggedIn = true;
    notifyListeners();
  }

  // void test() async {
  //   var dio = Dio();
  //   var res = await dio.get("http://192.168.43.31:8000/api/code");
  //   print(res.data.toString());
  // }

  void logout() {
    isLoggedIn = false;
    notifyListeners();
  }
}
