import 'package:ai_sys/Constants.dart';
import 'package:flutter/material.dart';


List<String> firstYearSubjects = [
  "Algorithms",
  "Mathematics",
  "Science",
  "Data 1",
  "Arabic",
  "Programming 1",
  "Physics",
  "Chemistry",
];

List<String> secondYearSubjects = [
  "Data 2",
  "Programming 2",
  "Programming 3",
  "English",
  "History",
  "Biology",
  "Statistics",
  "Calculus",
];

List<String> thirdYearSubjects = [
  "Database",
  "Networking",
  "AI",
  "Machine Learning",
];

class SubjectDrawer extends StatelessWidget {
  final List<String> drawerItems;
  final void Function(String) onRemoveItem;

  const SubjectDrawer({
    required this.drawerItems,
    required this.onRemoveItem,
  });

  @override
  Widget build(BuildContext context) {
    // المواد مصنفة حسب السنة
    List<String> firstYearSelected = drawerItems
        .where((subject) => firstYearSubjects.contains(subject))
        .toList();

    List<String> secondYearSelected = drawerItems
        .where((subject) => secondYearSubjects.contains(subject))
        .toList();

    List<String> thirdYearSelected = drawerItems
        .where((subject) => thirdYearSubjects.contains(subject))
        .toList();

    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      backgroundColor: primaryColor,
      width: 275,
      child: ListView(
        children: [
          if (firstYearSelected.isNotEmpty) ...[
            _buildYearTitle("First Year"),
            ...firstYearSelected
                .map((subject) => _buildDrawerItem(text: subject)),
            Divider(thickness: 0.8, color: Colors.blue),
          ],
          if (secondYearSelected.isNotEmpty) ...[
            _buildYearTitle("Second Year"),
            ...secondYearSelected
                .map((subject) => _buildDrawerItem(text: subject)),
            Divider(thickness: 0.8, color: Colors.blue),
          ],
          if (thirdYearSelected.isNotEmpty) ...[
            _buildYearTitle("Third Year"),
            ...thirdYearSelected
                .map((subject) => _buildDrawerItem(text: subject)),
            Divider(thickness: 0.8, color: Colors.blue),
          ],
        ],
      ),
    );
  }

  // 👇 لبناء عنوان السنة
  Widget _buildYearTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  // 👇 لبناء عنصر المادة
  Widget _buildDrawerItem({required String text}) {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.black,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IconButton(
              icon: Icon(Icons.clear, color: Colors.black),
              onPressed: () {
                onRemoveItem(text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
