import 'package:ai_sys/Constants.dart';
import 'package:ai_sys/Widgets/Big_Card.dart';
import 'package:ai_sys/Widgets/CustomTitle.dart';
import 'package:ai_sys/Widgets/DropDonwButtonCustom.dart';
import 'package:ai_sys/Widgets/ProfileTextField.dart';
import 'package:ai_sys/Widgets2(Not%20Used)/drawer.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final TextEditingController nameController =
      TextEditingController(text: "عباده سعده");
  final TextEditingController idController =
      TextEditingController(text: "202312345");
  final TextEditingController emailController =
      TextEditingController(text: "obadah@gmail.com");
  static String id = "ProfilePage";
  int selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
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
        body: Row(
          children: [
            AppDrawer(selectedIndex: selectedIndex),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'قم بتعديل بياناتك ومعلوماتك بما يتناسب مع احتياجاتك الدراسية.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    SizedBox(height: 20),
                    Big_Card(
                      children: [
                        CustomTitle("معلومات الحساب", Icons.person),
                        ProfileTextField(
                            label: "الاسم الكامل", controller: nameController),
                        ProfileTextField(
                            label: "رقم الطالب", controller: idController),
                        DropDonwButtonCustom(
                            label: "تخصص",
                            items: ["علوم الحاسب", "الهندسة", "إدارة أعمال"]),
                        ProfileTextField(
                            label: "البريد الإلكتروني",
                            controller: emailController),
                        SizedBox(height: 12),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: themeColor),
                          onPressed: () {},
                          child: Text(
                            "تحديث معلوماتك",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Big_Card(
                      children: [
                        CustomTitle("تغيير كلمة المرور", Icons.lock),
                        ProfileTextField(
                            label: "كلمة المرور الحالية", obscure: true),
                        ProfileTextField(
                            label: "كلمة المرور الجديدة", obscure: true),
                        ProfileTextField(
                            label: "تأكيد كلمة المرور الجديدة", obscure: true),
                        SizedBox(height: 12),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: themeColor),
                          onPressed: () {},
                          icon: Icon(
                            Icons.lock_reset,
                            color: Colors.white,
                          ),
                          label: Text(
                            "تحديث كلمة المرور",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
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
