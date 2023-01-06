import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:second_viva_app/dio.dart';

class auth extends ChangeNotifier {
  bool isLoggedIn = false;
  bool get authentificated => isLoggedIn;
  void login(var creds) async {
    print(creds);

    try {
      Dio.Response response = await dio().post('/sanctum/token', data: creds);
      print(response.statusCode);
      if (response.statusCode == 200) {
        String token = response.data.toString();
        this.tryToken(token: token);
      } else
        print(response.data.toString());
    } catch (e) {
      print(e);
    }
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

  void tryToken({String? token}) async {
    if (token == null) {
      print("no token");
      return;
    } else {
      try {
        Dio.Response response = await dio().get('/user',
            options: Dio.Options(headers: {'Authorization': 'Bearer $token'}));

        if (response.statusCode == 200) {
          print(response.data.toString());
          isLoggedIn = true;
          token = token;
          notifyListeners();
        } else {
          print(response.statusCode);
          print(response.data['message'].toString());
          isLoggedIn = false;
          notifyListeners();
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
