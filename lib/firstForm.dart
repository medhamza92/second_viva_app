import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:second_viva_app/homeScreen.dart';
import 'package:second_viva_app/vivaResult.dart';
import 'package:second_viva_app/dio.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FirstForm extends StatefulWidget {
  const FirstForm({Key? key}) : super(key: key);

  @override
  _FirstFormState createState() => _FirstFormState();
}

class _FirstFormState extends State<FirstForm> {
  double? vivaMark;
  TextEditingController ProjectName = new TextEditingController();
  TextEditingController Year = new TextEditingController();
  TextEditingController ExaminatorName = new TextEditingController();
  TextEditingController SupervisorName = new TextEditingController();
  TextEditingController PresidentName = new TextEditingController();
  TextEditingController ExaminatorMark = new TextEditingController();
  TextEditingController SupervisorMark = new TextEditingController();
  TextEditingController VivaPresidentMark = new TextEditingController();
  TextEditingController Students = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    vivaCalac() {
      vivaMark = double.parse(ExaminatorMark.text) * 0.3 +
          double.parse(SupervisorMark.text) * 0.3 +
          double.parse(VivaPresidentMark.text) * 0.3;
      return (vivaMark);
    }

    final storage = new FlutterSecureStorage();
    late var storedToken;
    getToken() async {
      storedToken = await storage.read(key: 'token');
      print(storedToken);
      return storedToken;
    }

    String code = "ddgdg";
    createViva(var datas, var storeddToken) async {
      try {
        Dio.Response response = await dio().post('/viva/create',
            data: datas,
            options: Dio.Options(
                headers: {'Authorization': 'Bearer $storeddToken'}));
        print(response.statusCode);
        if (response.statusCode == 201) {
          // print(response.data.toString());
          code = response.data['code'].toString();
        } else {
          var error = response.data.toString();
          print(error);
        }
      } catch (e) {
        print(e);
        return e;
      }
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Add New Viva'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => (HomeScreen())));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            // ******************************

            TextField(
              controller: ProjectName,
              onChanged: (value) {},
              decoration: InputDecoration(
                label: Text("Project Name"),
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            // ******************************

            TextField(
              controller: Year,
              onChanged: (value) {},
              decoration: InputDecoration(
                label: Text("Year"),
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            // ******************************

            TextField(
              controller: Students,
              onChanged: (value) {},
              decoration: InputDecoration(
                label: Text("Students"),
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            // ******************************

            TextField(
              controller: ExaminatorName,
              onChanged: (value) {},
              decoration: InputDecoration(
                label: Text("Examinator Name"),
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            // ******************************

            TextField(
              controller: SupervisorName,
              onChanged: (value) {},
              decoration: InputDecoration(
                label: Text("Supervisor Name"),
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            // ******************************

            TextField(
              controller: PresidentName,
              onChanged: (value) {},
              decoration: InputDecoration(
                label: Text("President Name"),
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            // ******************************

            TextField(
              controller: ExaminatorMark,
              onChanged: (value) {},
              decoration: InputDecoration(
                label: Text("Examinator Mark"),
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            // ******************************

            TextField(
              controller: SupervisorMark,
              onChanged: (value) {},
              decoration: InputDecoration(
                label: Text("Supervisor Mark"),
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            // ******************************

            TextField(
              controller: VivaPresidentMark,
              onChanged: (value) {},
              decoration: InputDecoration(
                label: Text("Viva-President Mark"),
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            ElevatedButton(
              child: Text('calcluate Viva'),
              onPressed: () async {
                Map datas = {
                  'project_name': ProjectName.text,
                  'year': Year.text,
                  'sup_mark': double.parse(SupervisorMark.text),
                  'exa_mark': double.parse(ExaminatorMark.text),
                  'pre_mark': double.parse(VivaPresidentMark.text),
                  'pre_name': VivaPresidentMark.text,
                  'exa_name': ExaminatorName.text,
                  'sup_name': SupervisorName.text,
                  'students': Students.text.split(','),
                  'final_mark': vivaCalac()
                };
                await getToken();
                await createViva(datas, storedToken);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => vivaResult(
                            ProjectName: ProjectName.text,
                            Year: Year.text,
                            ExaminatorName: ExaminatorName.text,
                            SupervisorName: SupervisorName.text,
                            PresidentName: PresidentName.text,
                            ExaminatorMark: ExaminatorMark.text,
                            SupervisorMark: SupervisorMark.text,
                            vivaMark: vivaCalac(),
                            VivaPresidentMark: VivaPresidentMark.text,
                            Students: Students.text,
                            vivaCode: code)));
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20),
                fixedSize: Size(300, 50),
                textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                primary: Color.fromARGB(255, 0, 57, 104),
                shape: StadiumBorder(),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
