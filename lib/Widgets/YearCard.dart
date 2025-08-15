import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class YearCard extends StatelessWidget {
  YearCard(
      {required this.text1,
      required this.color,
      @required this.text2,
      required this.onTap});
  String text1;
  String? text2;
  Color color;
  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, MajorsPage.id);
      },
      child: Card(
        color: Colors.white60,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      text1,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Icon(FontAwesomeIcons.graduationCap, color: color)
                  ],
                ),
                if (text2 != null)
                  Text(
                    text2!,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                // SizedBox(
                //   height: 50,
                // ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: color,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: onTap,
                    child: Center(
                      child: Text(
                        "Select",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              ]),
        ),
      ),
    );
  }
}
