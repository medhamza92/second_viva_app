import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:second_viva_app/finalMark.dart';
import 'package:second_viva_app/homeScreen.dart';

import 'package:second_viva_app/dio.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class consultCode extends StatefulWidget {
  const consultCode({super.key});

  @override
  State<consultCode> createState() => _consultCodeState();
}

class _consultCodeState extends State<consultCode> {
  TextEditingController vivaCode = new TextEditingController();
  final storage = new FlutterSecureStorage();
  late var storedToken;
  getToken() async {
    storedToken = await storage.read(key: 'token');
    return storedToken;
  }

  late var vivaData;
  checkViva(var datas, var storeddToken) async {
    try {
      Dio.Response response = await dio().post('/viva',
          data: datas,
          options:
              Dio.Options(headers: {'Authorization': 'Bearer $storeddToken'}));
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.data[0].toString());
        vivaData = response.data[0];
        print(vivaData);
      } else {
        var error = response.data.toString();
        print(error);
      }
    } catch (e) {
      print(e);
      return e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 57, 104),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => (HomeScreen())));
          },
        ),
        title: Text('Consult viva'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextField(
                controller: vivaCode,
                // ON cas Te7tajou onChanged
                onChanged: (value) {},
                decoration: InputDecoration(
                  label: Text("Enter viva code"),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text('Check '),
              onPressed: () async {
                Map datas = {'code': vivaCode.text};
                print(datas);
                await getToken();

                await checkViva(datas, storedToken);
                print(vivaData);
                print(jsonDecode(vivaData['students']));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => (finalMark(
                            ProjectName: vivaData['viva'],
                            Year: vivaData['year'].toString(),
                            ExaminatorName: vivaData['exa_name'],
                            ExaminatorMark: vivaData['exa_mark'].toDouble(),
                            PresidentName: vivaData['pre_name'],
                            VivaPresidentMark: vivaData['pre_mark'].toDouble(),
                            SupervisorName: vivaData['sup_name'],
                            SupervisorMark: vivaData['sup_mark'].toDouble(),
                            vivaCode: vivaData['code'],
                            Students: jsonDecode(vivaData['students']),
                            vivaMark: vivaData['final_mark'].toDouble()))));
              },
              style: ElevatedButton.styleFrom(
                // padding: EdgeInsets.all(20),
                fixedSize: Size(220, 50),
                textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                primary: Color.fromARGB(255, 0, 57, 104),
                shape: StadiumBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
