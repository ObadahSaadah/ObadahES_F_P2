import 'package:flutter/material.dart';

class HomePublicInfoContainer extends StatelessWidget {
  HomePublicInfoContainer(
      {required this.text1,
      required this.text2,
      required this.color,
      required this.icon,
      required this.iconColor});

  String text1;
  String text2;
  Color color;
  IconData icon;
  Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      constraints: BoxConstraints(maxHeight: 400),
      width: 300,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(
              flex: 1,
            ),
            Icon(icon, color: iconColor, size: 30),
            Spacer(
              flex: 2,
            ),
            Text(
              text1,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Spacer(
              flex: 2,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                text2,
                style: TextStyle(color: Colors.black, fontSize: 12),
                // overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
            Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
