import 'package:ai_sys/Bloc/Cubit/AuthCubit.dart';
import 'package:ai_sys/Bloc/States/AuthStates.dart';
import 'package:ai_sys/Constants.dart';
import 'package:ai_sys/Pages/MyInfo/AllCoursesPage.dart';
import 'package:ai_sys/Pages/Auth/LoginPage.dart';
import 'package:ai_sys/Pages/HomePage.dart';
import 'package:ai_sys/Pages/MyInfo/PlanPage.dart';
import 'package:ai_sys/Pages/MyInfo/ProfilePage.dart';
import 'package:ai_sys/Pages/recommandations/NoPlanPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatefulWidget {
  AppDrawer({required this.selectedIndex});
  Color initialColor = const Color(0xFF154C79);
  int selectedIndex;

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final List<String> drawerItems = [
    "الرئيسية",
    "المواد المتاحة",
    "توصيات المواد",
    "خطتي الدراسية",
    "الإعدادات",
    "تسجيل الخروج"
  ];

  final List<IconData> icons = [
    Icons.home,
    Icons.book,
    Icons.smart_button_outlined,
    Icons.book_outlined,
    Icons.settings,
    Icons.logout,
  ];

  final List<String> routes = [
    HomePage.id,
    AllCoursesPage.id,
    NoPlanPage.id,
    PlanPage.id,
    ProfilePage.id,
    LoginPage.id,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            LoginPage.id,
            (route) => false,
          );
        } else if (state is LogoutError) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        } else if (state is LogoutLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            ),
          );
        }
      },
      child: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        backgroundColor: const Color(0xFF154C79),
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
                  children: const [
                    Icon(
                      FontAwesomeIcons.graduationCap, // 🎓
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
                    _showLogoutConfirmationDialog(context);
                  } else {
                    Navigator.pushNamed(context, routes[index]);
                  }
                },
              );
            }),
          ],
        ),
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: const Text("تأكيد تسجيل الخروج"),
            content: const Text("هل أنت متأكد أنك تريد تسجيل الخروج؟"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text("إلغاء"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  Navigator.of(ctx).pop();
                  final authCubit = context.read<AuthCubit>();
                  final authState = authCubit.state;
                  if (authState is LoginSuccess) {
                    authCubit.logout(token: authState.token);
                  }
                },
                child:
                    const Text("تأكيد", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        );
      },
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
