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
        width: 360,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/final.png"), fit: BoxFit.cover)),
        child: Column(
          children: [
            Stack(
              children: [
                // PROJECT NAME
                Container(
                  margin: EdgeInsets.only(top: 41, left: 125),
                  child: Text(
                    '$ProjectName',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow),
                    textAlign: TextAlign.left,
                  ),
                ),
                // YEAR
                Container(
                  margin: EdgeInsets.only(top: 85, left: 50),
                  child: Text(
                    '$Year',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow),
                    textAlign: TextAlign.left,
                  ),
                ),
                // STUDENT 1
                Container(
                  margin: EdgeInsets.only(top: 200),
                  child: Text(
                    Students[0],
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                // STUDENT 2
                Container(
                  margin: EdgeInsets.only(top: 222),
                  child: Text(
                    Students[1],
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                // STUDENT 3
                Container(
                  margin: EdgeInsets.only(top: 245),
                  child: Text(
                    Students[2],
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                // PRESIDENT NAME
                Container(
                  margin: EdgeInsets.only(
                    top: 325,
                  ),
                  child: Text(
                    '$PresidentName',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                // EXAMINATOR NAME
                Container(
                  margin: EdgeInsets.only(
                    top: 408,
                  ),
                  child: Text(
                    '$ExaminatorName',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                // SUPERVISOR NAME
                Container(
                  margin: EdgeInsets.only(
                    top: 488,
                  ),
                  child: Text(
                    '$SupervisorName',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                // PRESIDENT MARK
                Container(
                  margin: EdgeInsets.only(top: 328, left: 260),
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
                  margin: EdgeInsets.only(top: 410, left: 260),
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
                  margin: EdgeInsets.only(top: 490, left: 260),
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
                  margin: EdgeInsets.only(top: 585, left: 116),
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
                  margin: EdgeInsetsDirectional.only(top: 276),
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
