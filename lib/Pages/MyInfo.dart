import 'package:ai_sys/Widgets2(Not%20Used)/drawer.dart';
import 'package:flutter/material.dart';

class MyInfoPage extends StatelessWidget {
  MyInfoPage({super.key});
  static String id = "MyInfoPage";
  bool isExpanded = true;
  bool isMobile = false;
  int selectedIndex = 2;

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
      ),
      body: Row(children: [
        Expanded(
          child: Center(
            child: Text(
              "Empty Page",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        if (!isMobile) AppDrawer(selectedIndex: selectedIndex),
      ]),
    );
  }
}
