import 'package:ai_sys/Pages/recommandations/RecommendationInfoPage.dart';
import 'package:ai_sys/Widgets2(Not%20Used)/drawer.dart';
import 'package:flutter/material.dart';

class NoPlanPage extends StatefulWidget {
  NoPlanPage({super.key});
  static String id = "NoPlanPage";

  @override
  State<NoPlanPage> createState() => _NoPlanPageState();
}

class _NoPlanPageState extends State<NoPlanPage> {
  bool isExpanded = true;
  final double expectedGPA = 3.25;
  final double currentGPA = 2.75;
  final double maxGPA = 4.0;
  bool isTherePlan = false;
  int selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      body: Row(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.white54),
                  child: Padding(
                    padding: EdgeInsets.all(60),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Flex(
                          direction: constraints.maxWidth > 600
                              ? Axis.horizontal
                              : Axis.vertical,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Spacer(flex: 1),
                            SizedBox(
                              width: constraints.maxWidth * 0.45,
                              child: Image.asset(
                                'assets/brain1.jpg',
                                fit: BoxFit.contain,
                              ),
                            ),
                            Spacer(flex: 1),
                            SizedBox(
                              width: constraints.maxWidth > 600
                                  ? constraints.maxWidth * 0.45
                                  : double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 0),
                                    child: Text(
                                      'شكل مستقبلك\nالأكاديمي مع الذكاء الاصطناعي!',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontSize: 45,
                                        fontWeight: FontWeight.bold,
                                        foreground: Paint()
                                          ..shader = LinearGradient(
                                            colors: <Color>[
                                              Colors.purple,
                                              Colors.pink,
                                            ],
                                          ).createShader(
                                            Rect.fromLTWH(
                                                0.0, 0.0, 200.0, 70.0),
                                          ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    'دع الذكاء الاصطناعي يبني خطة دراسية مثالية لك ويعزز معدلك التراكمي',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, RecommendationInfoPage.id);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      backgroundColor: Colors.transparent,
                                      shadowColor: Colors.transparent,
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 28, vertical: 12),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [Colors.purple, Colors.pink],
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Text(
                                              "ابدأ خطتك الآن",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          Icon(
                                            Icons.rocket_launch,
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(flex: 1),
                          ],
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          )),
          if (!isMobile) AppDrawer(selectedIndex: selectedIndex),
        ],
      ),
    );
  }
}
