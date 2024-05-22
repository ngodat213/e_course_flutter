import 'package:e_course_flutter/controller/favorite_course_controller.dart';
import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/screens/my_course_screen/widgets/my_course_widget.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:e_course_flutter/widgets/back_button.dart';
import 'package:e_course_flutter/widgets/base_text.dart';
import 'package:e_course_flutter/widgets/title_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteCourseScreen extends GetView<FavoriteCourseController> {
  const FavoriteCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 90),
                  _gridviewCourse(),
                  const SizedBox(height: 70),
                ],
              ),
              TitleScreen(title: S.of(context).favoriteCourse),
              BuildBackButton(top: 24),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _appbar(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.65,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BaseText(
            text: S.of(context).myCourse,
            textAlign: TextAlign.center,
            style: TxtStyle.h3.copyWith(color: AppColors.input),
            duration: const Duration(milliseconds: 1500),
            curve: Curves.easeInOut,
          ),
          BaseText(
            text: 'Start searching for courses',
            textAlign: TextAlign.center,
            style: TxtStyle.p.copyWith(color: AppColors.label),
            duration: const Duration(milliseconds: 1500),
            curve: Curves.easeInOut,
          )
        ],
      ),
    );
  }

  Obx _gridviewCourse() {
    return Obx(
      () => Column(
        children: controller.myFavCourse
            .map(
              (e) => GestureDetector(
                onTap: () {
                  // controller.(e);
                },
                child: MyCourseCard(course: e),
              ),
            )
            .toList(),
      ),
    );
  }
}
