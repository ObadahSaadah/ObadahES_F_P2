import 'package:ai_sys/Models/SubjectModel.dart';
import 'package:flutter/material.dart';

class SelectSubjectCard extends StatelessWidget {
  final Subject subject;
  final bool isSelected;
  final VoidCallback onSelect;

  const SelectSubjectCard({
    required this.subject,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 4,
            offset: Offset(2, 2),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subject.name,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              '${subject.credits} Credits',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.bar_chart, size: 16, color: Colors.grey),
              SizedBox(width: 4),
              Text('Difficulty: ${subject.difficulty}'),
            ],
          ),
          SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onSelect,
              style: ElevatedButton.styleFrom(
                backgroundColor: isSelected ? Colors.green : Colors.blue,
              ),
              child: Text(isSelected ? 'Added' : 'Add to Plan'),
            ),
          ),
        ],
      ),
    );
  }
}
