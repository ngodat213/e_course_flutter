import 'package:e_course_flutter/controller/main_controller.dart';
import 'package:e_course_flutter/screens/community_screen/community_screen.dart';
import 'package:e_course_flutter/screens/home_screen/home_screen.dart';
import 'package:e_course_flutter/screens/setting_screen/setting_screen.dart';
import 'package:e_course_flutter/screens/main_screen/widget/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      const HomeScreen(),
      // const CourseScreen(),
      const CommunityScreen(),
      const SettingScreen(),
    ];
    return Scaffold(
      bottomNavigationBar: const BuildBottomNavBar(),
      body: Obx(() => pages[controller.page.value]),
    );
  }
}
