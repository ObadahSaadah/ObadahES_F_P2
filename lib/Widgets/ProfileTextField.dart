import 'package:flutter/material.dart';

class ProfileTextField extends StatelessWidget {
  final TextEditingController? controller;
  final bool obscure;
  final String label;

  const ProfileTextField({
    Key? key,
    required this.label,
    this.controller,
    this.obscure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
