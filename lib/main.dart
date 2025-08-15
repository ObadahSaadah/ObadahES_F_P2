import 'package:ai_sys/Pages/CourseDetails.dart';
import 'package:ai_sys/Pages/HomePage.dart';
import 'package:ai_sys/Pages/LoginPage.dart';
import 'package:ai_sys/Pages/MyInfo.dart';
import 'package:ai_sys/Pages/ProfilePage.dart';
import 'package:ai_sys/Pages/CoursesPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginPage.id: (context) => LoginPage(),
        HomePage.id: (context) => HomePage(),
        CoursesPage.id: (context) => CoursesPage(),
        ProfilePage.id: (context) => ProfilePage(),
        CourseDetails.id: (context) => CourseDetails(),
        MyInfoPage.id: (context) => MyInfoPage(),
      },
      initialRoute: LoginPage.id,
    );
  }
}
