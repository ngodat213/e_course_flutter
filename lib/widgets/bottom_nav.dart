import 'package:e_course_flutter/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BuildBottomNavBar extends StatefulWidget {
  const BuildBottomNavBar({
    super.key,
  });

  @override
  State<BuildBottomNavBar> createState() => _BuildBottomNavBarState();
}

class _BuildBottomNavBarState extends State<BuildBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(horizontal: 39, vertical: 15),
      child: GNav(
        onTabChange: (value) {
          // context.read<MainCubit>().indexChanged(value);
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
