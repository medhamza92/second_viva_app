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
      Students;

  double? vivaMark;

  vivaResult({
    required this.ProjectName,
    required this.Year,
    required this.ExaminatorName,
    required this.SupervisorName,
    required this.PresidentName,
    required this.ExaminatorMark,
    required this.SupervisorMark,
    required this.VivaPresidentMark,
    required this.Students,
  });

  @override
  Widget build(BuildContext context) {
    double? vivaCalac() {
      vivaMark = double.parse(ExaminatorMark) * 0.3 +
          double.parse(SupervisorMark) * 0.3 +
          double.parse(VivaPresidentMark) * 0.3;

      return vivaMark;
    }

    ;
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
          vivaCalac().toString(),
          style: TextStyle(fontSize: 25),
        ),
      ]),
    );
  }
}
