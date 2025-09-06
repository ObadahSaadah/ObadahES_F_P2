import 'package:ai_sys/Bloc/Cubit/CoursesCubit.dart';
import 'package:ai_sys/Models/SubjectModel.dart';
import 'package:ai_sys/CourseDetailsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseCard extends StatefulWidget {
  final Subject subject;
  final bool isRecommand;

  const CourseCard(
      {super.key, required this.subject, required this.isRecommand});

  @override
  State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, CourseDetailsPage.id,
            arguments: widget.subject);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${widget.subject.type}',
                  style: const TextStyle(color: Colors.green),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(Icons.menu_book, color: Colors.blue),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      "${widget.subject.name}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                '${widget.subject.code}',
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(Icons.access_time, size: 18, color: Colors.blue),
                  const SizedBox(width: 4),
                  Text('${widget.subject.credits} ساعات'),
                  const SizedBox(width: 10),
                  if (widget.subject.is_failed)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.red.shade100,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        'راسب',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 12),
              if (widget.isRecommand)
                const Text(
                  'ترفع المعدل بناءً على نتائجك السابقة',
                  style: TextStyle(color: Colors.black87),
                ),
              const SizedBox(height: 50),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        final coursesCubit = context.read<CoursesCubit>();
                        final hoursCubit = context.read<HoursCubit>();

                        final isAlreadyAdded =
                            coursesCubit.addedIds.contains(widget.subject.id);

                        coursesCubit.toggleCourseSelection(widget.subject.id);

                        if (!isAlreadyAdded) {
                          hoursCubit.addCredits(widget.subject.credits);
                        } else {
                          hoursCubit.removeCredits(widget.subject.credits);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: context
                                .watch<CoursesCubit>()
                                .addedIds
                                .contains(widget.subject.id)
                            ? Colors.red
                            : Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Text(
                        context
                                .watch<CoursesCubit>()
                                .addedIds
                                .contains(widget.subject.id)
                            ? 'إلغاء'
                            : 'إضافة إلى جدولي',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, CourseDetailsPage.id,
                          arguments: widget.subject);
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text(
                      'تفاصيل أكثر',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
