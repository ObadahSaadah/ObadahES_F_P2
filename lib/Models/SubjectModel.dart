class Subject {
  final int id;
  final String name;
  final String code;
  final int credits;
  final String description;
  final String difficulty;
  final String status;
  final String student_Status;
  final String type;
  final bool is_failed;
  final double predicted_mark;

  const Subject({
    required this.id,
    required this.name,
    required this.code,
    required this.credits,
    required this.description,
    required this.difficulty,
    required this.status,
    required this.student_Status,
    required this.type,
    required this.is_failed,
    required this.predicted_mark,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      id: json['id'] ?? 1,
      name: json['course_name']?.toString() ?? '',
      code: json['course_number']?.toString() ?? '',
      credits: json['credit_hours'],
      description: json['description']?.toString() ?? '',
      difficulty: json['difficulty']?.toString() ?? 'متوسط',
      status: json['status']?.toString() ?? '',
      student_Status: json['history_status']?.toString() ?? '',
      type: json['requirement_type']?.toString() ?? '',
      is_failed: json['is_failed'] ?? false,
      predicted_mark: json['predicted_mark'] ?? 0,
    );
  }
}
