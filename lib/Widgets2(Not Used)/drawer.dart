import 'package:ai_sys/Constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatefulWidget {
  AppDrawer({required this.selectedIndex});
  Color initialColor = Color(0xFF154C79);
  int selectedIndex;

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final List<String> drawerItems = [
    "الرئيسية",
    "توصيات المواد",
    "بياناتي الأكاديمية",
    "الإعدادات",
    "تسجيل الخروج"
  ];

  final List<IconData> icons = [
    Icons.home,
    Icons.book,
    Icons.admin_panel_settings,
    Icons.home,
    Icons.output_outlined,
  ];

  final List<String> routes = [
    "HomePage",
    "CoursesPage",
    "MyInfoPage",
    "ProfilePage",
    "LoginPage",
  ];

  @override
  Widget build(BuildContext context) {
    // int selectedIndex = Provider.of<ProviderService>(context).selectedIndex;
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      backgroundColor: Color(0xFF154C79),
      width: 275,
      child: ListView(
        children: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: widget.initialColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.graduationCap, // أيقونة قبعة التخرج 🎓
                    size: 20,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "نظام التوصية الذكي",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ...List.generate(drawerItems.length, (index) {
            bool selected = (index == widget.selectedIndex);
            return _buildDrawerItem(
              text: drawerItems[index],
              icon: icons[index],
              selected: selected,
              onTap: () {
                if (index == drawerItems.length - 1) {
                  // تسجيل الخروج
                  Navigator.pushReplacementNamed(context, routes[index]);
                } else {
                  Navigator.pushNamed(context, routes[index]);
                }
              },
            );
          }),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required String text,
    required IconData icon,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: EdgeInsets.zero,
      color: text == "تسجيل الخروج"
          ? Colors.white70
          : (selected ? Colors.white : themeColor),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListTile(
          titleAlignment: ListTileTitleAlignment.center,
          onTap: onTap,
          leading: Icon(icon,
              color: text == "تسجيل الخروج"
                  ? Colors.red
                  : selected
                      ? Colors.black
                      : Colors.white),
          title: Text(
            text,
            style: TextStyle(
              color: text == "تسجيل الخروج"
                  ? Colors.red
                  : (selected ? Colors.black : Colors.white),
              fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
