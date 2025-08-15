import 'package:ai_sys/Pages/CourseDetails.dart';
import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  CourseCard({super.key});
  String status = "راسب";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, CourseDetails.id);
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
                child: const Text(
                  'الزامية',
                  style: TextStyle(color: Colors.green),
                ),
              ),
              const SizedBox(height: 12),

              Row(
                children: const [
                  Icon(Icons.menu_book, color: Colors.blue),
                  SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      'البرمجة المتقدمة',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              const Text(
                'CS301',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 12),

              // عدد الساعات وحالة المادة
              Row(
                children: [
                  const Icon(Icons.access_time, size: 18, color: Colors.blue),
                  const SizedBox(width: 4),
                  const Text('3 ساعات'),
                  const SizedBox(width: 10),
                  if (status == "راسب")
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

              // الوصف
              const Text(
                'ترفع المعدل بناءً على نتائجك السابقة',
                style: TextStyle(color: Colors.black87),
              ),
              const SizedBox(height: 50),

              // الأزرار
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text(
                        'إضافة إلى جدولي',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text('تفاصيل أكثر'),
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
