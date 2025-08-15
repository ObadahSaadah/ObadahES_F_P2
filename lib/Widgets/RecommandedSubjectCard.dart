import 'package:ai_sys/Models/SubjectModel.dart';
import 'package:flutter/material.dart';

class RecommandedSubjectCard extends StatelessWidget {
  RecommandedSubjectCard(
      {required this.subject,
      required this.buttonText,
      required this.color,
      required this.width,
      this.isRemoved = false,
      required this.onTap,
      required this.isCancel});
  double width;
  Subject subject;
  bool isCancel;
  bool isRemoved;
  String buttonText;
  Color color;
  void Function(Subject) onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        height: 160,
        decoration: BoxDecoration(
            color: Colors.grey[50], borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                      child: Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        subject.name,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    height: 23,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(4)),
                    child: Center(
                      child: Text("${subject.credits}+ Cridits"),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(Icons.stacked_line_chart_rounded)),
                  Text("Difficulty : " + subject.difficulty)
                ],
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () => onTap(subject),
                child: Card(
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  child: Container(
                    width: width,
                    height: 35,
                    color: isRemoved
                        ? Colors.red
                        : (isCancel ? Colors.grey[300] : color),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Center(
                      child: Text(
                        isRemoved
                            ? "Remove"
                            // : (isCancel ? "Cancel" : buttonText),
                            : buttonText,
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
