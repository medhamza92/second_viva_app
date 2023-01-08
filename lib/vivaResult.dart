import 'package:flutter/material.dart';
import 'package:second_viva_app/firstForm.dart';

class vivaResult extends StatelessWidget {
  String ProjectName,
      Year,
      ExaminatorName,
      SupervisorName,
      PresidentName,
      ExaminatorMark,
      SupervisorMark,
      VivaPresidentMark,
      vivaCode,
      Students;

  late double vivaMark;

  vivaResult(
      {required this.ProjectName,
      required this.Year,
      required this.ExaminatorName,
      required this.SupervisorName,
      required this.PresidentName,
      required this.ExaminatorMark,
      required this.SupervisorMark,
      required this.VivaPresidentMark,
      required this.Students,
      required this.vivaMark,
      required this.vivaCode});

  @override
  Widget build(BuildContext context) {
    Color getColor() {
      if (vivaMark < 10) {
        return Colors.red;
      } else {
        return Colors.green;
      }
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 0, 57, 104),
          automaticallyImplyLeading: false,
          title: Text('Add New Viva'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => (FirstForm())));
            },
          ),
        ),
        body: Container(
          width: 350,
          decoration: BoxDecoration(
              // image: DecorationImage(image: AssetImage("images/BgAppTest.jpg"),
              // fit: BoxFit.cover
              // )
              ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              child: Text(
                'Viva mark :',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 57, 104),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
              // decoration:
              // BoxDecoration(border: Border.all(color: Color.fromARGB(255, 0, 57, 104))),
              child: Text(
                '$vivaMark',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: getColor(),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Viva Code :',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 57, 104),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 70, right: 70, top: 5, bottom: 5),
              decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 0, 57, 104)),
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: SelectableText(
                '$vivaCode',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(101, 0, 0, 0),
                ),
              ),
            ),
          ]),
        ));
  }
}
