import 'package:ai_sys/Bloc/Cubit/AuthCubit.dart';
import 'package:ai_sys/Bloc/States/AuthStates.dart';
import 'package:ai_sys/Constants.dart';
import 'package:ai_sys/Pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  static String id = "LoginPage";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController studentIdController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
            color: primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushReplacementNamed(context, HomePage.id);
          }
        },
        builder: (context, state) {
          final cubit = context.read<AuthCubit>();

          String? errorMessage;
          if (state is LoginError) {
            errorMessage = state.message;
          }

          return Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Spacer(flex: 1),
                  CircleAvatar(
                    radius: 85,
                    backgroundImage: AssetImage("assets/learnMan.png"),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "مرحباً بك في منصة المرشد الأكاديمي",
                    style: TextStyle(
                      color: Colors.blueGrey.shade900,
                      fontSize: 28,
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: Card(
                      elevation: 4,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 24),
                      child: Padding(
                        padding: EdgeInsets.all(24),
                        child: Form(
                          key: _formKey,
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (errorMessage != null) ...[
                                  Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.red.shade50,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: Colors.red.shade300),
                                    ),
                                    child: Text(
                                      errorMessage,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.red.shade700,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                ],

                                // Text(
                                //   "رقم الطالب",
                                //   style: TextStyle(
                                //     color: Colors.black,
                                //     fontSize: 12,
                                //     fontWeight: FontWeight.bold,
                                //   ),
                                // ),
                                // SizedBox(height: 8),
                                // TextFormField(
                                //   keyboardType: TextInputType.number,
                                //   inputFormatters: [
                                //     FilteringTextInputFormatter.digitsOnly,
                                //   ],
                                //   controller: studentIdController,
                                //   textAlign: TextAlign.right,
                                //   decoration: InputDecoration(
                                //     filled: true,
                                //     fillColor:
                                //         Color.fromARGB(255, 246, 249, 249),
                                //     prefixIcon: Icon(Icons.person_outline),
                                //     hintText: "ادخل رقم الطالب",
                                //     hintTextDirection: TextDirection.rtl,
                                //     border: OutlineInputBorder(
                                //       borderRadius: BorderRadius.circular(12),
                                //     ),
                                //   ),
                                //   validator: (value) {
                                //     if (value == null || value.isEmpty) {
                                //       return "الرجاء إدخال رقم الطالب";
                                //     }
                                //     return null;
                                //   },
                                // ),
                                // SizedBox(height: 16),
                                // Email
                                Text(
                                  "البريد الالكتروني",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: emailController,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(255, 246, 249, 249),
                                    prefixIcon: Icon(Icons.mail_lock_outlined),
                                    hintText: "ادخل البريد الالكتروني",
                                    hintTextDirection: TextDirection.rtl,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "الرجاء إدخال البريد الإلكتروني";
                                    }
                                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                        .hasMatch(value)) {
                                      return "الرجاء إدخال بريد إلكتروني صالح";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 16),
                                // Password
                                Text(
                                  "كلمة السر",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                TextFormField(
                                  controller: passwordController,
                                  obscureText: true,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(255, 246, 249, 249),
                                    prefixIcon: Icon(Icons.lock_outline),
                                    hintText: "ادخل كلمة السر",
                                    hintTextDirection: TextDirection.rtl,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "الرجاء إدخال كلمة السر";
                                    }
                                    if (value.length < 6) {
                                      return "كلمة السر يجب أن تكون 6 أحرف على الأقل";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 24),
                                GestureDetector(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      cubit.login(
                                        // studentId: studentIdController.text,
                                        email: emailController.text,
                                        password: passwordController.text,
                                      );
                                    }
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 14),
                                    decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    alignment: Alignment.center,
                                    child: state is LoginLoading
                                        ? CircularProgressIndicator(
                                            color: Colors.white,
                                          )
                                        : Text(
                                            "تسجيل الدخول",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Spacer(flex: 2),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
