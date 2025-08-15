import 'package:flutter/material.dart';

class SubjectCard extends StatelessWidget {
  final String text;
  final bool isSelected;

  const SubjectCard({
    super.key,
    required this.text,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4,
        color: isSelected ? Colors.lightGreenAccent : Colors.white,
        child: Container(
          height: 50,
          width: 50,
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
