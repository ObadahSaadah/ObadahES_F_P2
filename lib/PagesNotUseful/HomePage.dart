// import 'package:ai_sys/Constants.dart';
// import 'package:ai_sys/Pages/PlanPage.dart';
// import 'package:ai_sys/Widgets/HomePublicInfoContainer.dart';
// import 'package:ai_sys/Widgets2/CustomContainerHome.dart';
// import 'package:ai_sys/Widgets2/drawer.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class Home extends StatelessWidget {
//   Home({super.key});
//   static String id = "Home";
//   bool isExpanded = true;
//   final double expectedGPA = 3.25;
//   final double currentGPA = 2.75;
//   final double maxGPA = 4.0;
//   bool isTherePlan = true;
//   int selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     double expectedHeight = (expectedGPA / maxGPA) * 200;
//     double currentHeight = (currentGPA / maxGPA) * 200;
//     bool isMobile = MediaQuery.of(context).size.width < 600;

//     return Scaffold(
//       backgroundColor: Colors.white60,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Color(0xFF154C79),
//         actions: [
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 10),
//             child: Text(
//               "المرشد الأكاديمي",
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 25,
//                   fontWeight: FontWeight.bold),
//             ),
//           )
//         ],
//       ),
//       body: Row(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Card(
//                     elevation: 8,
//                     margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//                     color: Colors.white,
//                     child: Padding(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 20, vertical: 35),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "Hi, Obadah!",
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 20),
//                               ),
//                               SizedBox(height: 5),
//                               Text(
//                                 "Start your academic improvement journey with our smart recommendations",
//                                 style: TextStyle(
//                                     color: Colors.grey[700], fontSize: 14),
//                               ),
//                             ],
//                           ),
//                           if (isTherePlan == false)
//                             Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 5),
//                               child: ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: themeColor,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(8),
//                                   ),
//                                 ),
//                                 onPressed: () {
//                                   Navigator.pushNamed(context, PlanPage.id);
//                                 },
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Icon(Icons.auto_fix_high,
//                                         color: Colors.white),
//                                     SizedBox(width: 2),
//                                     Padding(
//                                       padding:
//                                           EdgeInsets.symmetric(vertical: 10),
//                                       child: Text(
//                                         "Start your recommendation request",
//                                         style: TextStyle(color: Colors.white),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       InfoContainer(
//                         icon: Icons.library_books_outlined,
//                         text1: "عدد الساعات المكتسبة",
//                         text2: "85",
//                         text3: "ساعة معتمدة",
//                       ),
//                       InfoContainer(
//                         icon: Icons.hourglass_empty,
//                         text1: "عدد الساعات المكتسبة",
//                         text2: "85",
//                         text3: "ساعة معتمدة",
//                       ),
//                       InfoContainer(
//                         icon: Icons.star,
//                         text1: "عدد الساعات المكتسبة",
//                         text2: "85",
//                         text3: "ساعة معتمدة",
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Expanded(
//                         child: Column(
//                           children: [
//                             Stack(
//                               alignment: Alignment.bottomCenter,
//                               children: [
//                                 Container(
//                                   height: 300,
//                                   decoration: BoxDecoration(
//                                     color: Colors.grey[200],
//                                     borderRadius: BorderRadius.circular(12),
//                                   ),
//                                 ),
//                                 Container(
//                                   height: expectedHeight,
//                                   decoration: BoxDecoration(
//                                     color: Colors.green,
//                                     borderRadius: BorderRadius.circular(12),
//                                   ),
//                                   child: Center(
//                                     child: Text(
//                                       expectedGPA.toStringAsFixed(2),
//                                       style: TextStyle(
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 8),
//                             Text("المعدل المتوقع"),
//                           ],
//                         ),
//                       ),
//                       SizedBox(width: 16),
//                       Expanded(
//                         child: Column(
//                           children: [
//                             Stack(
//                               alignment: Alignment.bottomCenter,
//                               children: [
//                                 Container(
//                                   height: 300,
//                                   decoration: BoxDecoration(
//                                     color: Colors.grey[200],
//                                     borderRadius: BorderRadius.circular(12),
//                                   ),
//                                 ),
//                                 Container(
//                                   height: currentHeight,
//                                   decoration: BoxDecoration(
//                                     color: Colors.blue,
//                                     borderRadius: BorderRadius.circular(12),
//                                   ),
//                                   child: Center(
//                                     child: Text(
//                                       currentGPA.toStringAsFixed(2),
//                                       style: TextStyle(
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 8),
//                             Text("المعدل الحالي"),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   Card(
//                     margin: EdgeInsets.symmetric(horizontal: 20),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8)),
//                     color: Colors.white,
//                     child: Padding(
//                       padding:
//                           EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                               "How Does The Smart Recommendations System Work ?",
//                               style: TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold)),
//                           SizedBox(height: 30),
//                           Wrap(
//                             spacing: 10,
//                             runSpacing: 10,
//                             alignment: WrapAlignment.spaceBetween,
//                             children: [
//                               HomePublicInfoContainer(
//                                 color: Colors.green.shade100,
//                                 text1: "Recommendations",
//                                 text2:
//                                     "Makes Allocated Recommendations To Imporve Your Rate",
//                                 icon: Icons.trending_up,
//                                 iconColor: Colors.green,
//                               ),
//                               HomePublicInfoContainer(
//                                 color: Colors.purple.shade100,
//                                 text1: "AI",
//                                 text2:
//                                     "It Uses Advanced Algorithms To Determine The Best Paths",
//                                 icon: FontAwesomeIcons.brain,
//                                 iconColor: Colors.deepPurple,
//                               ),
//                               HomePublicInfoContainer(
//                                 color: Colors.blue.shade100,
//                                 text1: "Data Analysis",
//                                 text2:
//                                     "System Analyzes Your Academic Record And Your Previous Performance ",
//                                 icon: FontAwesomeIcons.database,
//                                 iconColor: Colors.blue,
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 30),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 30),
//                 ],
//               ),
//             ),
//           ),
//           AppDrawer(
//             selectedIndex: selectedIndex,
//           ),
//         ],
//       ),
//     );
//   }
// }
