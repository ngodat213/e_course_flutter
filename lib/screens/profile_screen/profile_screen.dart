import 'package:e_course_flutter/controller/profile_controller.dart';
import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/screens/profile_screen/widget/user_setting.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:e_course_flutter/widgets/title_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Obx(
          () => controller.isShowLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 100),
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 25,
                            ),
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _ChangedAvatar(),
                                const SizedBox(height: 12),
                                Center(
                                  child: Text(
                                      controller.currentAccount.value.username!,
                                      style: TxtStyle.h3),
                                ),
                                const SizedBox(height: 25),
                                const BuildUserSetting(),
                              ],
                            ),
                          ),
                        ],
                      ),
                      TitleScreen(title: S.of(context).accountSetting),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Center _ChangedAvatar() {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 106,
            height: 106,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(controller.currentAccount.value.photoUrl!),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                controller.changedAvatar();
              },
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: AppColors.main,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(width: 3, color: AppColors.white),
                ),
                child: const Center(
                  child: Icon(
                    size: 20,
                    Icons.camera_alt_rounded,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
