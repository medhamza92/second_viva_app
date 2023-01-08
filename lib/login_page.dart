import 'dart:convert';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:second_viva_app/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_viva_app/auth.dart';

import 'package:second_viva_app/homeScreen.dart';

class login_page extends StatefulWidget {
  const login_page({super.key});

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  final formkey = GlobalKey<FormState>();
  String errorMsg = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  var scode;
  var error;
  final storage = new FlutterSecureStorage();
  get storr => storage;
  login(var creds) async {
    print(creds);

    try {
      Dio.Response response = await dio().post('/sanctum/token', data: creds);

      scode = response.statusCode;
      if (response.statusCode == 200) {
        String token = response.data.toString();
        tryToken(token: token);
      } else {
        error = response.data['message'].toString();
      }
    } catch (e) {
      print(e);
      return e;
    }
  }

  void storeToken({String? token}) async {
    this.storage.write(key: 'token', value: token);
    print('token stored');
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
          token = token;
          storeToken(token: token);
        } else {
          print(response.statusCode);
          print(response.data['message'].toString());
        }
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 57, 104),
      body: Container(
        width: 360,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/login.png"), fit: BoxFit.cover)),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Viva Marks App 2',
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Login',
                style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'enter your Email',
                    labelStyle: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 255, 255, 255)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                controller: email,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "enter your password";
                  }
                },
              ),
              SizedBox(
                height: 35,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Enter Your Password',
                    labelStyle: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 255, 255, 255)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                controller: password,
                validator: (value) =>
                    value!.isEmpty ? 'enter your password ' : null,
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  // padding: EdgeInsets.all(20),
                  fixedSize: Size(220, 50),
                  backgroundColor: Colors.white,
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 0, 57, 104),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () async {
                  Map creds = {
                    'email': email.text,
                    'password': password.text,
                    'device_name': 'mobile',
                  };
                  var credss = jsonEncode(creds);
                  if (formkey.currentState!.validate()) {
                    // Provider.of<auth>(context, listen: false).login(credss);

                    await login(credss);
                    print(scode);

                    if (scode == 200) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => (HomeScreen())));
                    } else {
                      setState(() {
                        errorMsg = error;
                      });
                    }
                    error = null;
                    scode = null;
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => (HomeScreen())));
                  }
                },
              ),
              
              SizedBox(
                height: 30,
              ),

              Text('$errorMsg',style: TextStyle(color: Colors.red),)
            ],
          ),
        ),
      ),
    );
  }
}
