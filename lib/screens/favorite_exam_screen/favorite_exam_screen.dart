import 'package:e_course_flutter/controller/favorite_exam_controller.dart';
import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/screens/favorite_exam_screen/widgets/my_course_widget.dart';
import 'package:e_course_flutter/widgets/back_button.dart';
import 'package:e_course_flutter/widgets/title_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteExamScreen extends GetView<FavoriteExamController> {
  const FavoriteExamScreen({super.key});

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
              TitleScreen(title: S.of(context).myFavoriteExam),
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
        children: controller.myFavExam
            .map(
              (e) => GestureDetector(
                onTap: () {
                  // controller.(e);
                },
                child: MyExamWidget(exam: e),
              ),
            )
            .toList(),
      ),
    );
  }
}
