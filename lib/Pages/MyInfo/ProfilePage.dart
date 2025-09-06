import 'package:ai_sys/Bloc/Cubit/AuthCubit.dart';
import 'package:ai_sys/Bloc/States/AuthStates.dart';
import 'package:ai_sys/Models/UserModel.dart';
import 'package:ai_sys/Widgets/Big_Card.dart';
import 'package:ai_sys/Widgets/CustomTitle.dart';
import 'package:ai_sys/Widgets/ProfileTextField.dart';
import 'package:ai_sys/Widgets2(Not%20Used)/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  static String id = "ProfilePage";
  int selectedIndex = 4;

  @override
  Widget build(BuildContext context) {
    final authState = context.read<AuthCubit>().state;
    User? user;
    if (authState is LoginSuccess) {
      user = authState.user;
      nameController.text = user.name;
      idController.text = user.student_number.toString();
      emailController.text = user.email;
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white60,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFF154C79),
          title: const Text(
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
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Big_Card(
                      children: [
                        CustomTitle("معلومات الحساب", Icons.person),
                        ProfileTextField(
                          label: "الاسم الكامل",
                          controller: nameController,
                          readOnly: true,
                        ),
                        ProfileTextField(
                          label: "رقم الطالب",
                          controller: idController,
                          readOnly: true,
                        ),
                        ProfileTextField(
                          label: "البريد الإلكتروني",
                          controller: emailController,
                          readOnly: true,
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
