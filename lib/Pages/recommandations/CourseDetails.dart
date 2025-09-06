// import 'package:ai_sys/Constants.dart';
// import 'package:ai_sys/Widgets2(Not%20Used)/drawer.dart';
// import 'package:flutter/material.dart';

// class CourseDetails extends StatelessWidget {
//   static String id = "CourseDetails";
//   int selectedIndex = 1;

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         backgroundColor: Colors.white54,
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           backgroundColor: const Color(0xFF154C79),
//           title: Text(
//             "المرشد الأكاديمي",
//             style: TextStyle(
//                 color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
//           ),
//           centerTitle: true,
//         ),
//         body: Row(
//           children: [
//             AppDrawer(selectedIndex: selectedIndex),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('الذكاء الاصطناعي',
//                           style: TextStyle(
//                               color: Colors.blue,
//                               fontSize: 22,
//                               fontWeight: FontWeight.bold)),
//                       SizedBox(height: 8),
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.timelapse_rounded,
//                             color: themeColor,
//                           ),
//                           Text('3 ساعات معتمدة',
//                               style: TextStyle(fontSize: 16)),
//                           SizedBox(
//                               height: 15,
//                               child: VerticalDivider(
//                                 color: themeColor,
//                                 thickness: 2,
//                               )),
//                           Icon(
//                             color: themeColor,
//                             Icons.online_prediction,
//                           ),
//                           Text('اختيارية', style: TextStyle(fontSize: 16)),
//                           SizedBox(
//                               height: 15,
//                               child: VerticalDivider(
//                                 color: themeColor,
//                                 thickness: 5,
//                               )),
//                           Icon(
//                             Icons.star,
//                             color: Colors.yellow,
//                           ),
//                           Text('متوسط', style: TextStyle(fontSize: 16)),
//                         ],
//                       ),
//                       SizedBox(height: 8),
//                       Container(
//                         padding: EdgeInsets.all(8),
//                         color: Colors.yellow[100],
//                         child:
//                             Text('تمت مشاركة المادة مسبقًا ضمن خطتك الدراسية'),
//                       ),
//                       SizedBox(height: 16),
//                       Card(
//                         color: Colors.white,
//                         elevation: 3,
//                         child: Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text('وصف المادة',
//                                   style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold)),
//                               SizedBox(height: 8),
//                               Text(
//                                   'يتناول هذا المقرر مقدمة عامة حول علم الذكاء الاصطناعي، يشمل الأنظمة الخبيرة، التعلُّم الآلي، الشبكات العصبية، المنطق الضبابي.'),
//                               Divider(height: 30),
//                               Text('الشُعب المطروحة',
//                                   style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold)),
//                               SizedBox(height: 8),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                       child: Text(
//                                     'النوع',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 16),
//                                   )),
//                                   Expanded(
//                                       child: Text(
//                                     'الوقت',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 16),
//                                   )),
//                                   Expanded(
//                                       child: Text(
//                                     'المدرس',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 16),
//                                   )),
//                                 ],
//                               ),
//                               SizedBox(height: 8),
//                               _buildClassRow(
//                                   'نظري', '10:00 - 11:30', 'د. سامي'),
//                               _buildClassRow(
//                                   'نظري', '10:00 - 11:30', 'د. محمد'),
//                               Divider(height: 30),
//                               Text('سبب إضافتي لمادة الذكاء الاصطناعي',
//                                   style:
//                                       TextStyle(fontWeight: FontWeight.bold)),
//                               SizedBox(height: 8),
//                               Text(
//                                   'أرغب في تعلم المزيد حول الذكاء الاصطناعي ومجالاته المختلفة.'),
//                               Text(
//                                   'تعتبر هذه المادة أساسية في مجال علوم الحاسوب.'),
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 16),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Spacer(),
//                           Container(
//                             width: MediaQuery.of(context).size.width * 0.3,
//                             decoration: BoxDecoration(
//                                 color: themeColor,
//                                 borderRadius: BorderRadius.circular(16)),
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(vertical: 10),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 5),
//                                     child: Icon(
//                                       Icons.add,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   Text(
//                                     "إضافة إلى خطتي الدراسية",
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Spacer(),
//                         ],
//                       ),
//                       SizedBox(height: 10),
//                       Row(
//                         children: [
//                           Spacer(),
//                           Container(
//                             width: MediaQuery.of(context).size.width * 0.3,
//                             decoration: BoxDecoration(
//                                 border: Border.all(color: Colors.black),
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(16)
//                                 // backgroundColor: Colors.green,
//                                 ),
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(vertical: 10),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 5),
//                                     child: Icon(
//                                       Icons.replay,
//                                       color: themeColor,
//                                     ),
//                                   ),
//                                   Text(
//                                     "العودة إالى التوصيات",
//                                     style: TextStyle(
//                                       color: themeColor,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Spacer(),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildClassRow(String type, String time, String teacher) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         children: [
//           Expanded(child: Text(type)),
//           Expanded(child: Text(time)),
//           Expanded(child: Text(teacher)),
//         ],
//       ),
//     );
//   }
// }
