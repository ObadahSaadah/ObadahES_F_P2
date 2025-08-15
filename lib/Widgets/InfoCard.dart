import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InfoCard extends StatelessWidget {
  InfoCard(
      {required this.text1,
      required this.text2,
      required this.icon,
      required this.iconColor});

  IconData icon;
  String text1;
  String text2;
  Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      color: Colors.white,
      child: Container(
        width: 275,
        child: Padding(
          padding: EdgeInsets.only(left: 27, top: 25, bottom: 25, right: 27),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 0),
                      child: Text(
                        text1,
                        style: TextStyle(color: Colors.grey[700], fontSize: 14),
                      ),
                    ),
                    Icon(
                      icon,
                      color: iconColor,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                text2,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
