import 'package:ai_sys/Models/SubjectModel.dart';

abstract class CoursesStates {}

abstract class HoursStates {}

class HoursInitial extends HoursStates {}

class ShowCredits extends HoursStates {
  int credits;
  ShowCredits(this.credits);
}

class CoursesInitial extends CoursesStates {}

class CoursesLoading extends CoursesStates {}

class CoursesLoaded extends CoursesStates {
  final List<Subject> courses;
  CoursesLoaded(this.courses);
}

class CoursesError extends CoursesStates {
  final String message;
  CoursesError(this.message);
}

class RecommandationsLoading extends CoursesStates {}

class RecommandationsLoaded extends CoursesStates {
  final List<Subject> courses;
  RecommandationsLoaded(this.courses);
}

class RecommandationsError extends CoursesStates {
  final String message;
  RecommandationsError(this.message);
}

class PlanInitial extends CoursesStates {}

class PlanLoading extends CoursesStates {}

class PlanLoaded extends CoursesStates {
  final List<Subject> courses;
  final int removedCount;

  PlanLoaded(this.courses, {this.removedCount = 0});
}

class PlanSaving extends CoursesStates {}

class PlanError extends CoursesStates {
  final String message;
  PlanError(this.message);
}

// class CoursesSelectionChanged extends CoursesStates {
//   final List<Subject> courses;

//   CoursesSelectionChanged(this.courses);
// }
