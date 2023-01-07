import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_viva_app/auth.dart';
import 'package:second_viva_app/firstForm.dart';
import 'package:second_viva_app/login_page.dart';
import 'package:second_viva_app/consultVivaCode.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  final storage = new FlutterSecureStorage();
  late var storedToken;
  getToken() async {
    storedToken = await storage.read(key: 'token');
    return storedToken;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
            child: ListView(
          children: [
            ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.logout),
              onTap: () async {
                print(await getToken());
                await storage.delete(key: 'token');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => (login_page())));
              },
            )
          ],
        )),
        body: Container(
          width: 360,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/BgAppTest.jpg"),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text('Add A New viva'),
                onPressed: () async {
                  await getToken();
                  print(storedToken);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => (FirstForm())));
                },
                style: ElevatedButton.styleFrom(
                  // padding: EdgeInsets.all(20),
                  fixedSize: Size(300, 50),
                  textStyle:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  primary: Color.fromARGB(158, 255, 255, 255),
                  onPrimary: Color.fromARGB(255, 0, 57, 104),
                  side: BorderSide(
                      color: Color.fromARGB(255, 0, 57, 104), width: 2),
                  shape: StadiumBorder(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: Text('Consult Old vivas'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => (consultCode())));
                },
                style: ElevatedButton.styleFrom(
                  // padding: EdgeInsets.all(20),
                  fixedSize: Size(300, 50),
                  textStyle:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  primary: Color.fromARGB(158, 255, 255, 255),
                  onPrimary: Color.fromARGB(255, 0, 57, 104),
                  side: BorderSide(
                      color: Color.fromARGB(255, 0, 57, 104), width: 2),
                  shape: StadiumBorder(),
                ),
              ),
            ],
          ),
        ));
  }
}
