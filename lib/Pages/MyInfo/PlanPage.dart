import 'package:ai_sys/Bloc/Cubit/AuthCubit.dart';
import 'package:ai_sys/Bloc/Cubit/CoursesCubit.dart';
import 'package:ai_sys/Bloc/States/AuthStates.dart';
import 'package:ai_sys/Bloc/States/CoursesStates.dart';
import 'package:ai_sys/Constants.dart';
import 'package:ai_sys/Widgets/SubjectsCardContainer.dart';
import 'package:ai_sys/Widgets2(Not%20Used)/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlanPage extends StatelessWidget {
  PlanPage({super.key});
  static String id = "PlanPage";
  int selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = CoursesCubit();
        String token = "";
        final authState = context.read<AuthCubit>().state;
        if (authState is LoginSuccess) {
          token = authState.token;
        }
        cubit.getMyCourses(token: token);
        return cubit;
      },
      child: BlocBuilder<CoursesCubit, CoursesStates>(
        builder: (context, state) {
          final cubit = context.read<CoursesCubit>();
          String token = "";
          final authState = context.read<AuthCubit>().state;
          if (authState is LoginSuccess) {
            token = authState.token;
          }

          return Scaffold(
            backgroundColor: Colors.white60,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Color(0xFF154C79),
              title: Text(
                "المرشد الأكاديمي",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              actions: [
                if (state is PlanLoaded && state.removedCount > 0)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade600,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: const Icon(Icons.save, color: Colors.white),
                      label: state is PlanSaving
                          ? SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : Text(
                              "حفظ التغييرات (${state.removedCount})",
                              style: TextStyle(color: Colors.white),
                            ),
                      onPressed: state is PlanSaving
                          ? null
                          : () {
                              cubit.removeCourses(token: token);
                            },
                    ),
                  )
              ],
            ),
            body: Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                children: [
                  AppDrawer(selectedIndex: selectedIndex),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Builder(builder: (_) {
                        if (state is PlanLoading) {
                          return Center(
                              child: CircularProgressIndicator(
                            color: primaryColor,
                          ));
                        } else if (state is PlanLoaded) {
                          if (state.courses.isEmpty) {
                            return Center(
                              child: Text(
                                "لم تقم بإضافة أي مواد بعد",
                                style: TextStyle(fontSize: 18),
                              ),
                            );
                          }
                          return ListView(children: [
                            SubjectsCardContainer(
                                isRemoved: true,
                                subjects: state.courses,
                                buttonText: "إزالة",
                                color: Colors.red.shade400,
                                width: 100,
                                onTap: (subject) {
                                  cubit.removeCourseFromPlan(subject.id);
                                })
                          ]);
                        } else if (state is PlanError) {
                          return Center(
                            child: Text(
                              state.message,
                              style: TextStyle(color: Colors.red),
                            ),
                          );
                        }
                        return SizedBox();
                      }),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
