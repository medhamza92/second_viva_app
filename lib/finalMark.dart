import 'package:flutter/material.dart';
import 'package:second_viva_app/consultVivaCode.dart';

class finalMark extends StatelessWidget {
  var ProjectName,
      Year,
      ExaminatorName,
      SupervisorName,
      PresidentName,
      vivaCode;
  List<dynamic> Students;
  double? vivaMark, VivaPresidentMark, SupervisorMark, ExaminatorMark;

  finalMark(
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 57, 104),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => (consultCode())));
          },
        ),
        title: Text('Consult viva'),
      ),
      body: Container(
        width: 300,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/final.png"), fit: BoxFit.cover)),
        child: Column(
          children: [
            Stack(
              children: [
                // PROJECT NAME
                Container(
                  margin: EdgeInsets.only(top: 67, left: 113),
                  child: Text(
                    'WEB Development',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow),
                    textAlign: TextAlign.left,
                  ),
                ),
                // YEAR
                Container(
                  margin: EdgeInsets.only(top: 102, left: 50),
                  child: Text(
                    '2021',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow),
                    textAlign: TextAlign.left,
                  ),
                ),
                // STUDENT 1
                Container(
                  margin: EdgeInsets.only(top: 200, left: 5),
                  child: Text(
                    Students[0],
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                // STUDENT 2
                Container(
                  margin: EdgeInsets.only(top: 220, left: 5),
                  child: Text(
                    Students[1],
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                // STUDENT 3
                Container(
                  margin: EdgeInsets.only(top: 240, left: 5),
                  child: Text(
                    Students[2],
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                // PRESIDENT NAME
                Container(
                  margin: EdgeInsets.only(top: 301, left: 10),
                  child: Text(
                    '$PresidentName',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                // EXAMINATOR NAME
                Container(
                  margin: EdgeInsets.only(top: 368, left: 10),
                  child: Text(
                    '$ExaminatorName',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                // SUPERVISOR NAME
                Container(
                  margin: EdgeInsets.only(top: 435, left: 10),
                  child: Text(
                    '$SupervisorName',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                // PRESIDENT MARK
                Container(
                  margin: EdgeInsets.only(top: 304, left: 227),
                  child: Text(
                    '$VivaPresidentMark',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ),
                // EXAMINATOR MARK
                Container(
                  margin: EdgeInsets.only(top: 371, left: 227),
                  child: Text(
                    '$ExaminatorMark',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ),
                // SUPERVISOR MARK
                Container(
                  margin: EdgeInsets.only(top: 438, left: 227),
                  child: Text(
                    '$SupervisorMark',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ),
                // FINAL MARK
                Container(
                  margin: EdgeInsets.only(top: 513, left: 116),
                  child: Text(
                    '$vivaMark',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 57, 104),
                    ),
                  ),
                ),

                // DONT TOUCH THIS !!!
                Container(
                  margin: EdgeInsetsDirectional.only(top: 471),
                  child: Text(
                    '',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
