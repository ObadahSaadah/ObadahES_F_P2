import 'package:flutter/material.dart';

class FacultyTextField extends StatelessWidget {
  FacultyTextField({required this.hintText, required this.icon});

  IconData icon;
  String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(4)),
      child: TextField(
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            icon: Padding(
              padding: EdgeInsets.only(left: 40),
              child: Icon(
                icon,
                size: 30,
                color: Colors.grey,
              ),
            ),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey)),
      ),
    );
  }
}
