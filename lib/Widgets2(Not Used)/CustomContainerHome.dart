import 'package:ai_sys/Constants.dart';
import 'package:flutter/material.dart';

class InfoContainer extends StatelessWidget {
  InfoContainer(
      {required this.icon,
      required this.text1,
      required this.text2,
      required this.text3});
  IconData icon;
  String text1;
  String text2;
  String text3;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.sizeOf(context).width * 0.2,
      width: MediaQuery.sizeOf(context).width * 0.2,
      child: Card(
        color: Colors.white,
        elevation: 4,
        margin: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              color: themeColor,
            ),
            Text(
              text1,
              style: TextStyle(
                color: Colors.blue.shade800,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              text2,
              style: TextStyle(
                  color: Colors.blue.shade600,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              text3,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
