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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'enter your Email',
                    labelStyle:
                        TextStyle(fontSize: 15, color: Colors.grey.shade400),
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
                    labelStyle:
                        TextStyle(fontSize: 15, color: Colors.grey.shade400),
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
                child: Text('Login'),
                onPressed: () {
                  Map creds = {
                    'email': email.text,
                    'password': password.text,
                    'device_name': 'mobile',
                  };
                  if (formkey.currentState!.validate()) {
                    Provider.of<auth>(context, listen: false).login(creds);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => (HomeScreen())));
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
