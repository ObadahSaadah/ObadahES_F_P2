import 'dart:convert';
import 'package:ai_sys/Bloc/States/AuthStates.dart';
import 'package:ai_sys/Models/UserModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(LoginInitial());
  String baseUrl = "http://127.0.0.1:8000/api";

  Future<void> login({
    // required String studentId,
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());

    try {
      final response = await http.post(
        Uri.parse("$baseUrl/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          // "studentId":studentId,
          "email": email,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final user = User.fromJson(data["user"]);

        emit(LoginSuccess(
          token: data['token'],
          user: user,
          studentInfo: data['academic_summary'],
        ));
      } else {
        emit(LoginError("بيانات الدخول غير صحيحة"));
      }
    } catch (e) {
      emit(
          LoginError(" حدث خطأ أثناء الاتصال بالسيرفر الرجاء المحاولة لاحقاً"));
    }
  }

  Future<void> logout({
    required String token,
  }) async {
    emit(LogoutLoading());

    try {
      final response = await http.post(
        Uri.parse("$baseUrl/logout"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final message = data["message"];

        emit(LogoutSuccess(message));
      } else {
        emit(LogoutError("الرجاء المحاولة لاحقاً"));
      }
    } catch (e) {
      emit(LogoutError(
          " حدث خطأ أثناء الاتصال بالسيرفر الرجاء المحاولة لاحقاً"));
    }
  }
}
