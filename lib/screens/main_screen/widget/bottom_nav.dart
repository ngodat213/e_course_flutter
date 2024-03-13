import 'package:e_course_flutter/controller/main_controller.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BuildBottomNavBar extends GetView<MainController> {
  const BuildBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(horizontal: 39, vertical: 15),
      child: GNav(
        onTabChange: (value) {
          controller.page.value = value;
        },
        gap: 8,
        backgroundColor: Colors.white,
        color: AppColors.main,
        activeColor: AppColors.main,
        tabBackgroundColor: AppColors.main.withOpacity(0.3),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        tabs: const [
          GButton(iconSize: 24, icon: Icons.home, text: 'Home'),
          GButton(iconSize: 24, icon: Icons.play_arrow, text: 'Course'),
          GButton(iconSize: 24, icon: Icons.chat_bubble, text: 'Comunity'),
          GButton(iconSize: 24, icon: Icons.person, text: 'Setting')
        ],
      ),
    );
  }
}
