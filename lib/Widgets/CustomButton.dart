import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({required this.color, required this.text, required this.onTap});
  Color color;
  String text;
  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        height: 40,
        width: 280,
        child: Center(
          child: Text(
            "$text",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
