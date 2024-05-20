import 'package:e_course_flutter/controller/setting_controller.dart';
import 'package:e_course_flutter/managers/manager_path_routes.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildProfile extends GetView<SettingController> {
  const BuildProfile({
    this.color,
    super.key,
  });
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(ManagerRoutes.profileScreen);
      },
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
            controller.currentAccount.value.photoUrl!,
          ),
        ),
        title: Text(
          controller.currentAccount.value.username!,
          style: TxtStyle.h3.copyWith(
            color: color ?? AppColors.white,
          ),
        ),
        subtitle: Text(
          controller.currentAccount.value.email ?? "",
          style: TxtStyle.labelStyle.copyWith(
            color: color ?? AppColors.white,
          ),
        ),
      ),
    );
  }
}
