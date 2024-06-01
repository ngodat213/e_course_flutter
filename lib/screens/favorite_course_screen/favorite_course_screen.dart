import 'package:e_course_flutter/controller/favorite_course_controller.dart';
import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/screens/my_course_screen/widgets/my_course_widget.dart';
import 'package:e_course_flutter/widgets/back_button.dart';
import 'package:e_course_flutter/widgets/title_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteCourseScreen extends GetView<FavoriteCourseController> {
  const FavoriteCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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

  Obx _gridviewCourse() {
    return Obx(
      () => Column(
        children: controller.myFavCourse
            .map(
              (e) => GestureDetector(
                onTap: () {
                  controller.onPressCourse(e);
                },
                child: MyCourseCard(course: e),
              ),
            )
            .toList(),
      ),
    );
  }
}
