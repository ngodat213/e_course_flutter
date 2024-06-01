import 'package:e_course_flutter/controller/exam_play_controller.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionTitle extends GetView<ExamPlayController> {
  const QuestionTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            Container(
              margin: const EdgeInsets.all(25),
              child: Text(
                controller.currentLesson
                    .questions![controller.currentIndex.value].question!,
                style: TxtStyle.text,
              ),
            ),
            if (controller.currentLesson
                    .questions![controller.currentIndex.value].imageUrl !=
                null)
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 25,
                ),
                child: Image.network(
                  controller.currentLesson
                      .questions![controller.currentIndex.value].imageUrl!,
                ),
              ),
          ],
        ));
  }
}
