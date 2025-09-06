import 'package:ai_sys/Bloc/Cubit/AuthCubit.dart';
import 'package:ai_sys/Bloc/Cubit/CoursesCubit.dart';
import 'package:ai_sys/Pages/MyInfo/PlanPage.dart';
import 'package:ai_sys/Pages/recommandations/CourseDetails.dart';
import 'package:ai_sys/Pages/HomePage.dart';
import 'package:ai_sys/Pages/Auth/LoginPage.dart';
import 'package:ai_sys/Pages/MyInfo/AllCoursesPage.dart';
import 'package:ai_sys/Pages/recommandations/NoPlanPage.dart';
import 'package:ai_sys/Pages/MyInfo/ProfilePage.dart';
import 'package:ai_sys/Pages/recommandations/RecommandationsCoursesPage.dart';
import 'package:ai_sys/Pages/recommandations/RecommendationInfoPage.dart';
import 'package:ai_sys/CourseDetailsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
        ),
        BlocProvider<CoursesCubit>(
          create: (context) => CoursesCubit(),
        ),
        BlocProvider<HoursCubit>(
          create: (context) => HoursCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          LoginPage.id: (context) => LoginPage(),
          HomePage.id: (context) => HomePage(),
          RecommandationsCoursesPage.id: (context) =>
              RecommandationsCoursesPage(),
          ProfilePage.id: (context) => ProfilePage(),
          // CourseDetails.id: (context) => CourseDetails(),
          CourseDetailsPage.id: (context) => CourseDetailsPage(),
          AllCoursesPage.id: (context) => AllCoursesPage(),
          NoPlanPage.id: (context) => NoPlanPage(),
          RecommendationInfoPage.id: (context) => RecommendationInfoPage(),
          PlanPage.id: (context) => PlanPage(),
        },
        initialRoute: LoginPage.id,
      ),
    );
  }
}

class MyBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} changed: $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('${bloc.runtimeType} transition: $transition');
  }
}
