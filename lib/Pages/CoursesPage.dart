import 'package:ai_sys/Widgets2(Not%20Used)/SubjectCard.dart';
import 'package:ai_sys/Widgets2(Not%20Used)/drawer.dart';
import 'package:flutter/material.dart';

class CoursesPage extends StatelessWidget {
  CoursesPage({super.key});
  static String id = "CoursesPage";
  final int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF154C79),
        title: Text(
          "المرشد الأكاديمي",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        // actions:   [
        //   Padding(
        //     padding: EdgeInsets.symmetric(horizontal: 10),
        //     child: Text(
        //       "المرشد الأكاديمي",
        //       style: TextStyle(
        //           color: Colors.white,
        //           fontSize: 25,
        //           fontWeight: FontWeight.bold),
        //     ),
        //   ),
        // ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          children: [
            AppDrawer(selectedIndex: selectedIndex),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "توصيات الذكاء الاصطناعي",
                      style: TextStyle(color: Colors.blue, fontSize: 25),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "هذه قائمة المواد التي يُوصي بها النظام في الفصل القائم بناءاً على أداءك الأكاديمي و احتياجاتك الشخصية",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    SizedBox(height: 30),
                    Expanded(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          int count;
                          double width = constraints.maxWidth;
                          if (width > 1200) {
                            count = 4;
                          } else if (width > 800) {
                            count = 3;
                          } else if (width > 600) {
                            count = 2;
                          } else {
                            count = 1;
                          }

                          return GridView.count(
                            crossAxisCount: count,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 0.8,
                            children: List.generate(10, (_) => CourseCard()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
