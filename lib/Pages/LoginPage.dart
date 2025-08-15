import 'package:ai_sys/Constants.dart';
import 'package:ai_sys/Pages/HomePage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  static String id = "LoginPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 249, 250),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 238, 249, 250),
        title: Text(
          "المرشد الأكاديمي",
          style: TextStyle(
              color: primaryColor, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(flex: 1),
            CircleAvatar(
              radius: 85,
              backgroundImage: AssetImage("assets/learnMan.png"),
            ),
            SizedBox(height: 10),
            Text(
              "مرحباً بك في منصة المرشد الأكاديمي",
              style: TextStyle(color: Colors.blueGrey.shade900, fontSize: 28),
            ),
            SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width * 0.35,
              child: Card(
                elevation: 4,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 16),
                      Text(
                        "رقم الطالب",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      TextField(
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 246, 249, 249),
                          suffixIcon: Icon(Icons.lock_outline),
                          hintText: "ادخل رقم الطالب",
                          hintTextDirection: TextDirection.rtl,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                      SizedBox(height: 16),
                      SizedBox(height: 10),
                      Text(
                        "البريد الالكتروني",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      TextField(
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 246, 249, 249),
                          suffixIcon: Icon(Icons.mail_lock_outlined),
                          hintText: "ادخل البريد الالكتروني",
                          hintTextDirection: TextDirection.rtl,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "كلمة السر",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      TextField(
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 246, 249, 249),
                          suffixIcon: Icon(Icons.lock_outline),
                          hintText: "ادخل كلمة السر",
                          hintTextDirection: TextDirection.rtl,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                      SizedBox(height: 24),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          double cardWidth = constraints.maxWidth;
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      padding: WidgetStateProperty.all(
                                          EdgeInsets.zero),
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      minimumSize:
                                          WidgetStateProperty.all(Size(0, 0)),
                                    ),
                                    child: Text(
                                      "هل نسيت كلمة المرور ؟",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 0),
                                    height: 1,
                                    width: 100,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, HomePage.id);
                                },
                                child: Container(
                                  width: cardWidth * 0.5, // نصف عرض البطاقة
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "تسجيل الدخول",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(flex: 2)
          ],
        ),
      ),
    );
  }
}
