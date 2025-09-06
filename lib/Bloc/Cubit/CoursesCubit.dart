import 'dart:convert';
import 'package:ai_sys/Bloc/States/CoursesStates.dart';
import 'package:ai_sys/Models/SubjectModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class CoursesCubit extends Cubit<CoursesStates> {
  CoursesCubit() : super(CoursesInitial());

  String baseUrl = "http://127.0.0.1:8000/api";

  List<Subject> _allCourses = [];
  List<Subject> _myCourses = [];
  List<int> _removedIds = [];
  List<int> _addedIds = [];

  List<int> get addedIds => _addedIds;
  List<int> get removedIds => _removedIds;

  Future<void> getAllCourses({
    required String token,
    required HoursCubit hoursCubit,
  }) async {
    emit(CoursesLoading());
    try {
      final url = Uri.parse('$baseUrl/student/eligible-courses');
      final response = await http.get(
        url,
        headers: {"Authorization": "Bearer $token"},
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);

        int totalSelectedHours = data['plan_credit_hours'] ?? 0;

        _allCourses = (data['eligible_courses'] as List)
            .map((e) => Subject.fromJson(e as Map<String, dynamic>))
            .toList();

        // تحديث HoursCubit بالساعات المضافة
        hoursCubit.resetCredits();
        hoursCubit.addCredits(totalSelectedHours);

        emit(CoursesLoaded(_allCourses));
      } else {
        emit(CoursesError("خطأ في السيرفر: ${response.statusCode}"));
      }
    } catch (e) {
      emit(CoursesError("Exception: $e"));
    }
  }

  Future<void> getRecommadations({
    required String token,
    required int creditHours,
    required HoursCubit hoursCubit,
  }) async {
    emit(CoursesLoading());
    try {
      final url = Uri.parse('$baseUrl/student/recommend-plan-ml');
      final response = await http.post(
        url,
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json"
        },
        body: json.encode({"credit_hours": creditHours}),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;

        int totalSelectedHours = data['total_selected_hours'] ?? 0;
        final List<dynamic> coursesJson = data["courses"] ?? [];

        _allCourses = coursesJson
            .map((e) => Subject.fromJson(e as Map<String, dynamic>))
            .toList();

        // تحديث HoursCubit بالساعات المضافة
        hoursCubit.resetCredits();
        hoursCubit.addCredits(totalSelectedHours);

        emit(CoursesLoaded(_allCourses));
      } else {
        emit(CoursesError("خطأ في السيرفر: ${response.statusCode}"));
      }
    } catch (e) {
      emit(CoursesError("Exception: $e"));
    }
  }

  Future<void> getMyCourses({required String token}) async {
    emit(PlanLoading());
    try {
      final url = Uri.parse('$baseUrl/study-plans');
      final response = await http.get(
        url,
        headers: {"Authorization": "Bearer $token"},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List<dynamic>;

        final List<Subject> coursesList = [];
        for (var plan in data) {
          final courses = plan['courses'] as List<dynamic>;
          coursesList.addAll(
            courses.map((c) => Subject.fromJson(c as Map<String, dynamic>)),
          );
        }

        _myCourses = coursesList;
        _removedIds.clear();
        emit(PlanLoaded(_myCourses, removedCount: 0));
      } else {
        emit(PlanError("خطأ في السيرفر: ${response.statusCode}"));
      }
    } catch (e) {
      emit(PlanError("Exception: $e"));
    }
  }

  void removeCourseFromPlan(int subjectId) {
    _removedIds.add(subjectId);
    _myCourses.removeWhere((subject) => subject.id == subjectId);
    emit(PlanLoaded(_myCourses, removedCount: _removedIds.length));
  }

  Future<void> removeCourses({required String token}) async {
    if (_removedIds.isEmpty) return;

    emit(PlanSaving());

    try {
      final url = Uri.parse('$baseUrl/student/selected-courses');
      final response = await http.delete(
        url,
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json"
        },
        body: json.encode({"course_ids": _removedIds}),
      );

      if (response.statusCode == 200) {
        await getMyCourses(token: token);
      } else {
        emit(PlanError("خطأ في حذف المواد: ${response.statusCode}"));
      }
    } catch (e) {
      emit(PlanError("Exception: $e"));
    }
  }

  void toggleCourseSelection(int subjectId) {
    if (_addedIds.contains(subjectId)) {
      _addedIds.remove(subjectId);
    } else {
      _addedIds.add(subjectId);
    }
    emit(CoursesLoaded(_allCourses));
  }

  Future<void> addCourses(
      {required String token, required HoursCubit hoursCubit}) async {
    if (_addedIds.isEmpty) return;

    emit(PlanSaving());

    try {
      final url = Uri.parse('$baseUrl/student/selected-courses');
      final response = await http.post(
        url,
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json"
        },
        body: json.encode({"course_ids": _addedIds}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        _addedIds.clear();
        // إعادة جلب جميع المواد بعد الحفظ لتحديث _allCourses و HoursCubit
        await getAllCourses(token: token, hoursCubit: hoursCubit);
      } else {
        emit(PlanError("خطأ في إضافة المواد: ${response.statusCode}"));
      }
    } catch (e) {
      emit(PlanError("Exception: $e"));
    }
  }

  Future<void> addCourses1(
      {required String token, required HoursCubit hoursCubit}) async {
    if (_addedIds.isEmpty) return;

    emit(PlanSaving());

    try {
      final url = Uri.parse('$baseUrl/student/selected-courses');
      final response = await http.post(
        url,
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json"
        },
        body: json.encode({"course_ids": _addedIds}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        _addedIds.clear();
        // إعادة جلب جميع المواد بعد الحفظ لتحديث _allCourses و HoursCubit
        await getRecommadations(
            token: token, hoursCubit: hoursCubit, creditHours: 18);
      } else {
        emit(PlanError("خطأ في إضافة المواد: ${response.statusCode}"));
      }
    } catch (e) {
      emit(PlanError("Exception: $e"));
    }
  }
}

class HoursCubit extends Cubit<HoursStates> {
  HoursCubit() : super(HoursInitial());

  int _addedHours = 0;

  int get addedHours => _addedHours;

  void addCredits(int credits) {
    _addedHours += credits;
    emit(ShowCredits(_addedHours));
  }

  void removeCredits(int credits) {
    _addedHours -= credits;
    if (_addedHours < 0) _addedHours = 0;
    emit(ShowCredits(_addedHours));
  }

  void resetCredits() {
    _addedHours = 0;
    emit(ShowCredits(_addedHours));
  }
}
