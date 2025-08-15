import 'package:flutter/material.dart';

class PlanInfoContainer extends StatelessWidget {
  PlanInfoContainer(
      {required this.text1, required this.text2, required this.color});

  String text1;
  String text2;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(0),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        height: 100,
        width: 200,
        decoration: BoxDecoration(color:color),
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          children: [
            // SizedBox(
            //   height: 10,
            // ),
            Spacer(),
            Text(
              text1,
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            Spacer(),
            Text(
              text2,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
