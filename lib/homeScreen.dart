import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_viva_app/auth.dart';
import 'package:second_viva_app/login_page.dart';

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
  getToken() async {
    return await storage.read(key: 'token');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Text("hello")),
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
        )));
  }
}
