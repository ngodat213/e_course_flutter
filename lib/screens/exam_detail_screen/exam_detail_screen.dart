import 'package:e_course_flutter/controller/exam_detail_controller.dart';
import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/models/exam_lesson.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:e_course_flutter/widgets/back_button.dart';
import 'package:e_course_flutter/widgets/readmore_html.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class ExamDetailScreen extends GetView<ExamDetailController> {
  const ExamDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Obx(() => controller.isShowLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 70),
                          Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width - 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    controller.exam.value.imageUrl!),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          const BuildContent(),
                        ],
                      ),
                    ),
                    _favoriteButton(context),
                    BuildBackButton(top: 24),
                  ],
                ),
              )),
      ),
    );
  }

  Widget _favoriteButton(BuildContext context) {
    return Positioned(
      top: 24,
      right: 25,
      child: GestureDetector(
        onTap: () {
          controller.onPressFav();
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            boxShadow: AppColors.shadow,
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Obx(
            () => Icon(
              controller.isFav.value ? Icons.favorite : Icons.favorite_border,
              color: controller.isFav.value ? Colors.red : Colors.grey,
              size: 16,
            ),
          ),
        ),
      ),
    );
  }
}

class BuildContent extends GetView<ExamDetailController> {
  const BuildContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text(controller.exam.value.title!, style: TxtStyle.h2),
            const SizedBox(height: 6),
            const SizedBox(height: 16),
            ReadMoreHtml(
              htmlContent: controller.exam.value.description!,
              trimLines: 2,
              trimCollapsedText: 'Read more',
              trimExpandedText: 'Show less',
              style: TxtStyle.text.copyWith(color: const Color(0xFF93989A)),
            ),
            const SizedBox(height: 32),
            Text(S.of(context).lesson, style: TxtStyle.title),
            const SizedBox(height: 12),
            Obx(() => controller.isShowLoading
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: controller.examLessons
                        .map((e) => _lessonQuiz(lesson: e))
                        .toList(),
                  )),
            const SizedBox(height: 50)
          ],
        ),
      ],
    );
  }
}

class _lessonQuiz extends GetView<ExamDetailController> {
  const _lessonQuiz({
    required this.lesson,
  });

  final ExamLesson lesson;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.onPressLesson(lesson);
      },
      child: Container(
        height: 65,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: AppColors.shadow,
            color: AppColors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              Container(
                width: 45,
                height: 45,
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.main,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(lesson.title!, style: TxtStyle.text),
                  Expanded(child: Container()),
                  Text('${lesson.hour}h ${lesson.minute}m ${lesson.second}s',
                      style: TxtStyle.labelStyle),
                ],
              ),
              Expanded(child: Container()),
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColors.grey,
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Center(
                      child: Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: AppColors.main,
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
