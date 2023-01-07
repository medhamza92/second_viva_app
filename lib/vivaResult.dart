import 'package:flutter/material.dart';

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

  double? vivaMark;

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
   

    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'Viva mark :',
          style: TextStyle(
            backgroundColor: Color.fromARGB(255, 0, 57, 104),
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          '$vivaMark',
          style: TextStyle(fontSize: 25),
          
        ),Text(
          'Viva Code :',
          style: TextStyle(
            backgroundColor: Color.fromARGB(255, 0, 57, 104),
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          '$vivaCode',
          style: TextStyle(fontSize: 25),
        ),
        
      ]),
    );
  }
}
