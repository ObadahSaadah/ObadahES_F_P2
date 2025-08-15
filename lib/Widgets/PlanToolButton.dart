import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlanToolButton extends StatelessWidget {
  PlanToolButton({
    this.color,
    this.textColor,
    this.iconColor,
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;
  final Color? color;
  final Color? textColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 0.4),
        ),
        width: 130,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(color: textColor ?? Colors.black),
            ),
            SizedBox(width: 2),
            Icon(icon, color: iconColor ?? Colors.black),
          ],
        ),
      ),
    );
  }
}
