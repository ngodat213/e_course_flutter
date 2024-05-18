import 'package:e_course_flutter/controller/exam_play_controller.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomButtonWidget extends GetView<ExamPlayController> {
  const BottomButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('BottomButtonPage')),
        body: const SafeArea(child: Text('BottomButtonController')));
  }
}

class _NextButton extends GetView<ExamPlayController> {
  const _NextButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.onPressNext();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          color: AppColors.main,
          borderRadius: BorderRadius.circular(8),
        ),
        height: 50,
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Next',
              style: TxtStyle.button.copyWith(color: AppColors.white),
            ),
            const Icon(
              Icons.keyboard_arrow_right_rounded,
              color: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class _BackButton extends GetView<ExamPlayController> {
  const _BackButton();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.onPressBack();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          color: AppColors.main,
          borderRadius: BorderRadius.circular(8),
        ),
        height: 50,
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.keyboard_arrow_left_rounded,
              color: AppColors.white,
            ),
            Text(
              'Prev',
              style: TxtStyle.button.copyWith(color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
