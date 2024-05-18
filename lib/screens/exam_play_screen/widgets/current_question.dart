import 'package:e_course_flutter/controller/exam_play_controller.dart';
import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrentQuestion extends GetView<ExamPlayController> {
  const CurrentQuestion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: const BoxDecoration(color: AppColors.main),
      child: Center(
        child: Text(
            '${S.of(context).question} ${controller.currentIndex}/${controller.currentLesson.questions!.length}',
            style: TxtStyle.p),
      ),
    );
  }
}
