import 'package:e_course_flutter/controller/exam_play_controller.dart';
import 'package:e_course_flutter/managers/manager_path_routes.dart';
import 'package:e_course_flutter/screens/exam_play_screen/widgets/current_question.dart';
import 'package:e_course_flutter/screens/exam_play_screen/widgets/option_widget.dart';
import 'package:e_course_flutter/screens/exam_play_screen/widgets/question_title.dart';
import 'package:e_course_flutter/screens/exam_play_screen/widgets/time_remaining.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckResultPage extends GetView<ExamPlayController> {
  const CheckResultPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: const BottomButtonWidget(),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              SizedBox(
                child: Column(
                  children: [
                    const CurrentQuestion(),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 10,
                      color: const Color.fromARGB(255, 2, 9, 61),
                    ),
                    const SizedBox(height: 18),
                    const TimeRemaining(title: "Result"),
                    const QuestionTitle(),
                    const OptionWidget()
                  ],
                ),
              ),
              const _HomeButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeButton extends StatelessWidget {
  const _HomeButton();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      right: 10,
      child: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            boxShadow: AppColors.shadow,
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.logout_outlined),
        ),
      ),
    );
  }
}
