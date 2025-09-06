import 'package:ai_sys/Constants.dart';
import 'package:ai_sys/Models/SubjectModel.dart';
import 'package:flutter/material.dart';

class CourseDetailsPage extends StatelessWidget {
  static String id = "CourseDetailsPage";
  CourseDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    Subject subject = data["subject"];
    bool isR = data["isR"];
    print(subject.status);
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ColorScheme.fromSeed(
            seedColor: themeColor, brightness: Brightness.light),
        appBarTheme: AppBarTheme(
          backgroundColor: themeColor,
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("تفاصيل المادة"),
          ),
          backgroundColor: const Color(0xFFF3F7FB),
          body: LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth >= 900;

              return Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1100),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          HeaderCard(subject: subject),
                          const SizedBox(height: 16),
                          GridView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: isWide ? 2 : 1,
                              mainAxisExtent: 110,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                            ),
                            children: [
                              _InfoTile(
                                title: "الرمز",
                                value: subject.code,
                                icon: Icons.numbers,
                              ),
                              _InfoTile(
                                title: "عدد الساعات",
                                value: subject.credits.toString(),
                                icon: Icons.av_timer,
                              ),
                              if (isR)
                                _InfoTile(
                                  title: "النتيجة المتوقعة",
                                  value: "${subject.predicted_mark}",
                                  icon: Icons.batch_prediction,
                                ),
                              // _InfoTile(
                              //   title: "الحالة",
                              //   value: _arabicStatus(subject.status),
                              //   icon: Icons.verified,
                              //   valueChipColor: _statusColor(subject.status),
                              // ),
                              _InfoTile(
                                title: "نوع المتطلب",
                                value: subject.type,
                                icon: Icons.merge_type_rounded,
                                valueChipColor: Colors.lightGreen,
                              ),
                              // if (subject.student_Status != "not_taken_before")
                              if (subject.is_failed ||
                                  subject.student_Status == "failed_before")
                                _InfoTile(
                                    title: "الحالة",
                                    value: "راسب",
                                    icon: Icons.info,
                                    valueChipColor: Colors.red),
                              if (subject.is_conditional ||
                                  subject.student_Status ==
                                      "conditional_promotion")
                                _InfoTile(
                                  title: "الحالة",
                                  value: "ترفع شرطي",
                                  icon: Icons.info,
                                  valueChipColor: Colors.orange[200],
                                ),
                              if (subject.is_conditional == false &&
                                      subject.is_failed == false ||
                                  subject.student_Status == "not_taken_before")
                                _InfoTile(
                                  title: "الحالة",
                                  value: "لم يتم تقديمها",
                                  icon: Icons.info,
                                  valueChipColor: Colors.grey,
                                ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          _DescriptionCard(description: subject.description),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  static String _arabicStatus(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return 'نشِطة';
      case 'inactive':
        return 'غير نشِطة';
      default:
        return status;
    }
  }

  static Color _statusColor(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return const Color(0xFF2E7D32);
      case 'inactive':
        return const Color(0xFFD32F2F);
      default:
        return const Color(0xFF616161);
    }
  }
}

class HeaderCard extends StatelessWidget {
  final Subject subject;
  const HeaderCard({required this.subject});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1C5D93), Color(0xFF154C79)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
              color: Colors.black12, blurRadius: 18, offset: Offset(0, 8)),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Icons.menu_book, color: Colors.white, size: 30),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Wrap(
              runSpacing: 8,
              children: [
                Text(
                  subject.name,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    height: 1.2,
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.14),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white24),
                  ),
                  child: Text(
                    subject.code,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color? valueChipColor;

  const _InfoTile({
    required this.title,
    required this.value,
    required this.icon,
    this.valueChipColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 0,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE3ECF5)),
        ),
        child: Row(
          children: [
            Container(
              height: 46,
              width: 46,
              decoration: BoxDecoration(
                color: const Color(0xFF154C79).withOpacity(0.08),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: const Color(0xFF154C79)),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                        color: Color(0xFF3E5C76),
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      )),
                  const SizedBox(height: 6),
                  if (valueChipColor == null)
                    Text(
                      value,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    )
                  else
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: valueChipColor!.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: valueChipColor!.withOpacity(0.25)),
                      ),
                      child: Text(
                        value,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: valueChipColor,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DescriptionCard extends StatelessWidget {
  final String? description;
  const _DescriptionCard({this.description});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 0,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE3ECF5)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.description, color: Color(0xFF154C79)),
                SizedBox(width: 8),
                Text(
                  "الوصف",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF154C79),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              (description == null || description!.trim().isEmpty)
                  ? "لا يوجد وصف متاح لهذه المادة."
                  : description!,
              style: const TextStyle(
                  fontSize: 15, height: 1.6, color: Color(0xFF334155)),
            ),
          ],
        ),
      ),
    );
  }
}
