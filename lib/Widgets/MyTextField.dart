import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyTextField extends StatelessWidget {
  MyTextField({
    required this.text,
    @required this.hight,
    @required this.width,
  });

  String text;
  double? hight;
  double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: hight,
      width: width,
      padding: EdgeInsets.only(bottom: 8),
      child: TextField(
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.4),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue.shade800, width: 0.6),
          ),
        ),
      ),
    );
  }
}
