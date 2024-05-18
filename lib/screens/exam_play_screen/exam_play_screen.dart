import 'package:e_course_flutter/controller/exam_play_controller.dart';
import 'package:e_course_flutter/enums/state_play.dart';
import 'package:e_course_flutter/screens/exam_play_screen/widgets/check_result_page.dart';
import 'package:e_course_flutter/screens/exam_play_screen/widgets/commit_page.dart';
import 'package:e_course_flutter/screens/exam_play_screen/widgets/play_page.dart';
import 'package:e_course_flutter/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExamPlayScreen extends GetView<ExamPlayController> {
  const ExamPlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.state == StatePlay.PLAY) {
        return const ExamPlayPage();
      } else if (controller.state == StatePlay.COMMIT) {
        return const CommitPage();
      } else if (controller.state == StatePlay.RESULT) {
        return const CheckResultPage();
      } else {
        return const HomeScreen();
      }
    });
  }
}
