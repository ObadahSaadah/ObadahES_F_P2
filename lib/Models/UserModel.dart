class User {
  final int id;
  final String name;
  final String email;
  final String student_number;
  final String role;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.student_number,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      student_number: json['student_number']?.toString() ?? '',
      role: json['role']?.toString() ?? 'UnKnown',
    );
  }
}
