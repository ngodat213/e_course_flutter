import 'package:e_course_flutter/controller/exam_play_controller.dart';
import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/screens/exam_play_screen/widgets/bottom_button_widget.dart';
import 'package:e_course_flutter/screens/exam_play_screen/widgets/commit_buttom.dart';
import 'package:e_course_flutter/screens/exam_play_screen/widgets/current_question.dart';
import 'package:e_course_flutter/screens/exam_play_screen/widgets/option_widget.dart';
import 'package:e_course_flutter/screens/exam_play_screen/widgets/question_title.dart';
import 'package:e_course_flutter/screens/exam_play_screen/widgets/time_remaining.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ExamPlayPage extends GetView<ExamPlayController> {
  const ExamPlayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomButtonWidget(),
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
                    Obx(() {
                      controller.formatTime();
                      return TimeRemaining(
                          title:
                              '${controller.hour}h ${controller.min}m ${controller.sec}s ${S.of(context).remaining}');
                    }),
                    const QuestionTitle(),
                    const OptionWidget()
                  ],
                ),
              ),
              const CommitButton(),
            ],
          ),
        ),
      ),
    );
  }
}
