import 'package:e_course_flutter/controller/exam_play_controller.dart';
import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/managers/manager_path_routes.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/images.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommitPage extends GetView<ExamPlayController> {
  const CommitPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main.withOpacity(0.8),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Images.imageConfetti),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(controller.currentLesson.title!, style: TxtStyle.h2),
                const SizedBox(height: 16),
                Text(S.of(context).yourResult, style: TxtStyle.title),
                const SizedBox(height: 16),
                Row(
                  children: [
                    BoxResult(
                        res: controller.userCorrect,
                        title: S.of(context).correct),
                    BoxResult(res: controller.fail, title: S.of(context).fail),
                    BoxResult(
                        res: controller.point.ceil(),
                        title: S.of(context).point),
                  ],
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildButton(
                      onTap: () {
                        Get.offAndToNamed(ManagerRoutes.examDetailScreen);
                      },
                      text: S.of(context).goHome,
                      bgColor: AppColors.grey,
                      style: TxtStyle.text.copyWith(color: Colors.black),
                    ),
                    _buildButton(
                      onTap: () {
                        controller.onPressCheckResult();
                      },
                      text: S.of(context).checkResult,
                      bgColor: AppColors.main,
                      style: TxtStyle.text.copyWith(color: AppColors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _buildButton extends StatelessWidget {
  const _buildButton({
    required this.text,
    required this.onTap,
    required this.bgColor,
    required this.style,
  });
  final String text;
  final VoidCallback onTap;
  final Color bgColor;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          width: (Get.width - 130) / 2,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(text, style: style),
          ),
        ),
      ),
    );
  }
}

class BoxResult extends StatelessWidget {
  const BoxResult({
    super.key,
    required this.res,
    required this.title,
  });
  final int res;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (Get.width - 130) / 3,
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: AppColors.shadow,
      ),
      child: Column(
        children: [
          Text('$res', style: TxtStyle.button.copyWith(color: Colors.black)),
          const SizedBox(height: 8),
          Text(title, style: TxtStyle.text),
        ],
      ),
    );
  }
}
