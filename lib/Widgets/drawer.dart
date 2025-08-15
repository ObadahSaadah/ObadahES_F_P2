// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class AppDrawer extends StatefulWidget {
//   AppDrawer({required this.selectedIndex});

//   int selectedIndex;

//   @override
//   _AppDrawerState createState() => _AppDrawerState();
// }

// class _AppDrawerState extends State<AppDrawer> {
//   final List<String> drawerItems = [
//     "Home",
//     "My Plan",
//     // "Recommendation Request",
//     "Faculty Admin",
//     // "Settings",
//     // "Help ?",
//     // "About Us",
//   ];

//   final List<IconData> icons = [
//     Icons.home,
//     Icons.book,
//     // Icons.mail,
//     Icons.admin_panel_settings,
//     // Icons.settings,
//     // Icons.help,
//     // Icons.info
//   ];

//   final List<String> routes = [
//     HomePage.id,
//     MyStudentPlanPage.id,
//     // RecommandationRequestPage.id,
//     FacultyAdminPage.id,
//     // SettingsPage.id,
//     // HelpPage.id,
//     // AboutUs.id
//   ];

//   @override
//   Widget build(BuildContext context) {
//     // int selectedIndex = Provider.of<ProviderService>(context).selectedIndex;
//     return Drawer(
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.zero,
//       ),
//       backgroundColor: primaryColor,
//       width: 275,
//       child: ListView(
//         children: [
//           // ✅ Drawer Header
//           DrawerHeader(
//             decoration: BoxDecoration(
//               color: primaryColor,
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Icon(
//                   FontAwesomeIcons.graduationCap, // أيقونة قبعة التخرج 🎓
//                   size: 20,
//                   color: Colors.white,
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   "AI Recommandations System",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // ✅ عناصر القائمة
//           ...List.generate(drawerItems.length, (index) {
//             bool selected = (index == widget.selectedIndex);
//             return _buildDrawerItem(
//               text: drawerItems[index],
//               icon: icons[index],
//               selected: selected,
//               onTap: () {
//                 // Provider.of<ProviderService>(context, listen: false)
//                 //     .setSelectedIndex(index);
//                 Navigator.pushNamed(context, routes[index]);
//               },
//             );
//           }),
//         ],
//       ),
//     );
//   }

//   Widget _buildDrawerItem({
//     required String text,
//     required IconData icon,
//     required bool selected,
//     required VoidCallback onTap,
//   }) {
//     return Card(
//       margin: EdgeInsets.zero,
//       color: selected ? Colors.white60 : primaryColor,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
//       child: ListTile(
//         onTap: onTap,
//         leading: Icon(icon, color: Colors.white),
//         title: Text(
//           text,
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: selected ? FontWeight.bold : FontWeight.normal,
//           ),
//         ),
//       ),
//     );
//   }
// }
