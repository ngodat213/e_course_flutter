import 'package:e_course_flutter/screens/setting_screen/widget/logout.dart';
import 'package:e_course_flutter/screens/setting_screen/widget/setting_menu.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/widgets/build_profile.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 36),
                    BuildProfile(color: AppColors.input),
                    SettingMenu(),
                    LogoutTile(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
