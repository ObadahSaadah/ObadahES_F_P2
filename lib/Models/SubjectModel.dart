class Subject {
  final String name;
  final int credits;
  final int year;
  final String difficulty;
  bool isSelected;

  Subject({
    required this.name,
    required this.credits,
    required this.difficulty,
    required this.year,
    this.isSelected = false,
  });
}
