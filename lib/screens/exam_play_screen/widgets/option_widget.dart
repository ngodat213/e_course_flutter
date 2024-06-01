import 'package:e_course_flutter/controller/exam_play_controller.dart';
import 'package:e_course_flutter/enums/state_play.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OptionWidget extends GetView<ExamPlayController> {
  const OptionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.state == StatePlay.PLAY) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.currentLesson
                .questions![controller.currentIndex.value].options!.length,
            itemBuilder: (context, index) {
              return OptionChooice(index: index);
            },
          );
        } else if (controller.state == StatePlay.RESULT) {
          var userChooises = controller.userChooise;
          var questions = controller.currentLesson.questions!;
          var currentIndex = controller.currentIndex.value;
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.currentLesson
                .questions![controller.currentIndex.value].options!.length,
            itemBuilder: (context, index) {
              int chooice = 0;
              if (userChooises[currentIndex] != -1) {
                if (userChooises[currentIndex] == 5 &&
                    questions[currentIndex].answer == index) {
                  chooice = 1;
                } else if (userChooises[currentIndex] != 5) {
                  if (questions[currentIndex].answer == index) {
                    chooice = 1;
                  } else if (userChooises[currentIndex] == index) {
                    chooice = 2;
                  }
                }
              } else if (questions[currentIndex].answer == index) {
                chooice = -1;
              }
              return _OptionResult(
                option: questions[currentIndex].options![index],
                chooice: chooice,
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class OptionChooice extends GetView<ExamPlayController> {
  const OptionChooice({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final int currentIndex = controller.currentIndex.value;
      final isSelected = index == controller.userChooise[currentIndex];
      final String option =
          controller.currentLesson.questions![currentIndex].options![index];
      return GestureDetector(
        onTap: () {
          controller.userChooise[currentIndex] = index;
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
          constraints: const BoxConstraints(minHeight: 60),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            boxShadow: AppColors.shadow,
            borderRadius: BorderRadius.circular(8),
            color: isSelected ? AppColors.main : AppColors.white,
          ),
          child: Row(
            children: [
              isSelected
                  ? Container(
                      margin: const EdgeInsets.symmetric(horizontal: 18),
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(width: 3, color: AppColors.white),
                        color: AppColors.main,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    )
                  : Container(
                      margin: const EdgeInsets.symmetric(horizontal: 18),
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: AppColors.colorBlue,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: 250,
                child: Text(
                  option,
                  style: isSelected
                      ? TxtStyle.text.copyWith(color: AppColors.white)
                      : TxtStyle.text,
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}

class _OptionResult extends StatelessWidget {
  const _OptionResult({
    required this.option,
    required this.chooice,
  });
  final String option;
  final int chooice;

  @override
  Widget build(BuildContext context) {
    final Color color;
    if (chooice == 1) {
      color = Colors.green;
    } else if (chooice == -1) {
      color = AppColors.main;
    } else if (chooice == 2) {
      color = Colors.red;
    } else {
      color = AppColors.colorBlue;
    }
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      constraints: const BoxConstraints(minHeight: 60),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: AppColors.shadow,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 18),
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              border: Border.all(width: 3, color: AppColors.white),
              color: color,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: 250,
            child: Text(
              option,
              style: TxtStyle.text,
            ),
          )
        ],
      ),
    );
  }
}
