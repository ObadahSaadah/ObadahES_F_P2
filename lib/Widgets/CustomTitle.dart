import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final IconData icon;

  const CustomTitle(this.title, this.icon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue),
        SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
