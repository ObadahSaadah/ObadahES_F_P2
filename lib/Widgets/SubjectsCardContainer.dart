import 'package:ai_sys/Models/SubjectModel.dart';
import 'package:ai_sys/Widgets/RecommandedSubjectCard.dart';
import 'package:flutter/material.dart';

class SubjectsCardContainer extends StatelessWidget {
  final String title;
  final List<Subject> subjects;
  SubjectsCardContainer(
      {required this.title,
      required this.subjects,
      this.isRemoved = false,
      required this.buttonText,
      required this.color,
      required this.width,
      required this.onTap});
  String buttonText;
  Color color;
  double width;
  bool isRemoved;
  void Function(Subject) onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 500,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 4 / 2,
                  ),
                  itemCount: subjects.length,
                  itemBuilder: (context, index) {
                    Subject subject = subjects[index];
                    return RecommandedSubjectCard(
                        subject: subject,
                        buttonText:
                            subject.isSelected ? "Cancel" : "Add To Plan",
                        color: color,
                        width: width,
                        onTap: onTap,
                        isRemoved: isRemoved,
                        isCancel:
                            subject.isSelected
                        );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
