import 'package:ai_sys/Constants.dart';
import 'package:ai_sys/Pages/recommandations/RecommandationsCoursesPage.dart';
import 'package:ai_sys/Widgets2(Not%20Used)/drawer.dart';
import 'package:flutter/material.dart';

class RecommendationInfoPage extends StatefulWidget {
  RecommendationInfoPage({super.key});
  static String id = "RecommendationInfoPage";

  @override
  State<RecommendationInfoPage> createState() => _RecommendationInfoPageState();
}

class _RecommendationInfoPageState extends State<RecommendationInfoPage> {
  int selectedIndex = 2;

  // String selectedSemester = 'الخريف';
  // String selectedYear = '2025';
  // String selectedMajor = 'برمجة';

  double desiredCreditHours = 15;

  // List<String> semesters = ['الخريف', 'الربيع', 'الصيف'];
  // List<String> years = ['2023', '2024', '2025', '2026', '2027'];
  // List<String> majors = ['برمجة', 'ذكاء اصطناعي', 'شبكات'];

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(children: [
          if (!isMobile) AppDrawer(selectedIndex: selectedIndex),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "لننشئ خطة دراسية مثالية لك!",
                        style: TextStyle(color: primaryColor, fontSize: 25),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "املأ بياناتك ودع الذكاء الاصطناعي يقترح أفضل خطة دراسية لك",
                        style: TextStyle(color: Colors.grey[700], fontSize: 15),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          color: Colors.white,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            width: 500,
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "الساعات الدراسية المطلوبة",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey[700],
                                  ),
                                ),
                                SizedBox(height: 5),
                                Slider(
                                  value: desiredCreditHours,
                                  min: 12,
                                  max: 18,
                                  divisions: 9,
                                  label: desiredCreditHours.round().toString(),
                                  activeColor: primaryColor,
                                  inactiveColor: Colors.blue[100],
                                  onChanged: (value) {
                                    setState(() {
                                      desiredCreditHours = value;
                                    });
                                  },
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('12'),
                                    Text('18'),
                                  ],
                                ),
                                SizedBox(height: 30),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      RecommandationsCoursesPage.id,
                                      arguments: desiredCreditHours.round(),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.psychology_alt,
                                    color: Colors.white,
                                  ),
                                  label: Text(
                                    "إنشاء خطتي الدراسية",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF007BFF),
                                    padding: EdgeInsets.symmetric(vertical: 15),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    minimumSize: Size(double.infinity, 50),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Card(
                          color: Colors.white,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            width: 300,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/robot1.jpg',
                                  width: 300,
                                  height: 300,
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "حالة المساعد الذكي",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.info_outline,
                                      size: 16,
                                      color: Colors.blue,
                                    ),
                                    SizedBox(width: 5),
                                    Expanded(
                                      child: Text(
                                        "املأ جميع الحقول المطلوبة للحصول على خطة دراسية مخصصة لك",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
