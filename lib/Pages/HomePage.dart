import 'package:ai_sys/Pages/PlanPage.dart';
import 'package:ai_sys/Widgets/CardTable.dart';
import 'package:ai_sys/Widgets/HomePublicInfoContainer.dart';
import 'package:ai_sys/Widgets/InfoCard.dart';
import 'package:ai_sys/Widgets2(Not%20Used)/drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  static String id = "HomePage";
  bool isExpanded = true;
  final double expectedGPA = 3.25;
  final double currentGPA = 2.75;
  final double maxGPA = 4.0;
  bool isTherePlan = true;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double expectedHeight = (expectedGPA / maxGPA) * 200;
    double currentHeight = (currentGPA / maxGPA) * 200;
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor:  Color(0xFF154C79),
        title: Text(
          "المرشد الأكاديمي",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Row(
        children: [
          Expanded(
            child: ListView(
              children: [
                Card(
                  elevation: 8,
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 35),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "أهلاً بعودتك !",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "ابدأ رحلة تحسينك الأكاديمي مع توصياتنا الذكية",
                                style: TextStyle(
                                    color: Colors.grey[700], fontSize: 14),
                              ),
                            ],
                          ),
                          if (!isMobile)
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, PlanPage.id);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color.fromARGB(
                                            255, 205, 118, 239), // Purple Light
                                        Color.fromARGB(
                                            255, 215, 87, 238), // Medium Purple
                                        Color(0xFF7B1FA2), // Deep Purple
                                      ],
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        child: Text(
                                          "ابدأ طلب التوصية الخاص بك",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      SizedBox(width: 2),
                                      Icon(Icons.auto_fix_high,
                                          color: Colors.white),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                if (isTherePlan)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          InfoCard(
                              icon: Icons.show_chart,
                              iconColor: Colors.blue,
                              text1: "المعدل التراكمي الحالي",
                              text2: "2.75"),
                          InfoCard(
                              icon: Icons.clear,
                              iconColor: Colors.red,
                              text1: "المواد الراسبة",
                              text2: "3"),
                          InfoCard(
                              icon: Icons.lightbulb,
                              iconColor: Colors.orangeAccent.shade400,
                              text1: "عدد التوصيات",
                              text2: "12"),
                          InfoCard(
                              icon: Icons.star_rate_rounded,
                              iconColor: Colors.purple.shade700,
                              text1: "أفضل الموصى بها",
                              text2: "Data 1"),
                        ],
                      ),
                    ),
                  ),
                SizedBox(height: 10),
                if (isTherePlan)
                  Card(
                    elevation: 8,
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    color: Colors.white,
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("معدل التحسن المتوقع"),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Container(
                                          height: 300,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                        Container(
                                          height: expectedHeight,
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Center(
                                            child: Text(
                                              expectedGPA.toStringAsFixed(2),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Text("المعدل المتوقع"),
                                  ],
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Container(
                                          height: 300,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                        Container(
                                          height: currentHeight,
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Center(
                                            child: Text(
                                              currentGPA.toStringAsFixed(2),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Text("المعدل الحالي"),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                isTherePlan
                    ? CardTable(
                        text1: "اسم المادة",
                        text2: "الساعات",
                        text3: "الصعوبة",
                        text4: "المستوى المطلوب",
                        text21: "Data 1",
                        text22: "3",
                        text23: "متوسط",
                        stars: 2,
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Image.asset(
                          "assets/artificial-intelligence-8945820.jpg",
                          width: 400,
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                SizedBox(height: 20),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("كيف يعمل نظام التوصيات الذكية ؟",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 30),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          alignment: WrapAlignment.spaceBetween,
                          children: [
                            HomePublicInfoContainer(
                              color: Colors.green.shade100,
                              text1: "التوصيات",
                              text2:
                                  "يقدم توصيات مخصصة لتحسين معدل الفائدة الخاص بك",
                              icon: Icons.trending_up,
                              iconColor: Colors.green,
                            ),
                            HomePublicInfoContainer(
                              color: Colors.purple.shade100,
                              text1: "AI",
                              text2:
                                  "يستخدم خوارزميات متقدمة لتحديد أفضل المسارات",
                              icon: FontAwesomeIcons.brain,
                              iconColor: Colors.deepPurple,
                            ),
                            HomePublicInfoContainer(
                              color: Colors.blue.shade100,
                              text1: "تحليل البيانات",
                              text2:
                                  "يقوم النظام بتحليل سجلك الأكاديمي وأدائك السابق ",
                              icon: FontAwesomeIcons.database,
                              iconColor: Colors.blue,
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
          if (!isMobile) AppDrawer(selectedIndex: selectedIndex),
        ],
      ),
    );
  }
}
