import 'package:ai_sys/Bloc/Cubit/AuthCubit.dart';
import 'package:ai_sys/Bloc/Cubit/CoursesCubit.dart';
import 'package:ai_sys/Bloc/States/AuthStates.dart';
import 'package:ai_sys/Bloc/States/CoursesStates.dart';
import 'package:ai_sys/Constants.dart';
import 'package:ai_sys/Widgets2(Not%20Used)/SubjectCard.dart';
import 'package:ai_sys/Widgets2(Not%20Used)/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllCoursesPage extends StatelessWidget {
  AllCoursesPage({super.key});
  static String id = "AllCoursesPage";
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CoursesCubit>(
          create: (context) {
            final authState = context.read<AuthCubit>().state;
            if (authState is LoginSuccess) {
              return CoursesCubit()..getAllCourses(token: authState.token);
            } else {
              return CoursesCubit();
            }
          },
        ),
        BlocProvider<HoursCubit>(
          create: (context) => HoursCubit(),
        ),
      ],
      child: Scaffold(
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
            BlocBuilder<CoursesCubit, CoursesStates>(
              builder: (context, state) {
                final cubit = context.read<CoursesCubit>();
                final authState = context.read<AuthCubit>().state;
                if (authState is! LoginSuccess) return const SizedBox();

                final hasChanges =
                    cubit.addedIds.isNotEmpty || cubit.removedIds.isNotEmpty;

                if (state is PlanSaving) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade600,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: const Icon(Icons.save, color: Colors.white),
                      label: SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: null,
                    ),
                  );
                }

                return hasChanges
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.shade600,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          icon: const Icon(Icons.save, color: Colors.white),
                          label: Text(
                            "حفظ التغييرات (${cubit.addedIds.length + cubit.removedIds.length})",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          onPressed: () async {
                            await cubit.addCourses(token: authState.token);
                          },
                        ),
                      )
                    : const SizedBox();
              },
            ),
          ],
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            children: [
              AppDrawer(selectedIndex: selectedIndex),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: BlocBuilder<CoursesCubit, CoursesStates>(
                    builder: (context, state) {
                      if (state is CoursesLoading) {
                        return Center(
                            child:
                                CircularProgressIndicator(color: primaryColor));
                      } else if (state is CoursesLoaded) {
                        List subjects = [];

                        subjects = state.courses;
                        if (subjects.isEmpty) {
                          return Center(child: Text("لا يوجد بيانات لعرضها"));
                        }

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BlocBuilder<HoursCubit, HoursStates>(
                              builder: (context, state) {
                                int addedHours = 0;
                                if (state is ShowCredits) {
                                  addedHours = state.credits;
                                }
                                return addedHours > 0
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          "عدد الساعات المضافة: $addedHours",
                                          style: TextStyle(
                                              color: Colors.blue, fontSize: 25),
                                        ),
                                      )
                                    : SizedBox();
                              },
                            ),
                            Text(
                              "المواد المتاحة لك",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 25),
                            ),
                            SizedBox(height: 10),
                            Expanded(
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  int count;
                                  double width = constraints.maxWidth;
                                  if (width > 1200) {
                                    count = 4;
                                  } else if (width > 800) {
                                    count = 3;
                                  } else if (width > 600) {
                                    count = 2;
                                  } else {
                                    count = 1;
                                  }

                                  return GridView.count(
                                    crossAxisCount: count,
                                    crossAxisSpacing: 12,
                                    mainAxisSpacing: 12,
                                    childAspectRatio: 0.8,
                                    children: List.generate(
                                      subjects.length,
                                      (index) => CourseCard(
                                        subject: subjects[index],
                                        isRecommand: false,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      } else if (state is CoursesError) {
                        return Center(child: Text(state.message));
                      }

                      return SizedBox();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
