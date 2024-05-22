import 'package:e_course_flutter/models/exam.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyExamWidget extends StatelessWidget {
  const MyExamWidget({
    required this.exam,
    super.key,
  });
  final Exam exam;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(25, 10, 25, 0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
            child: Image.network(
              exam.imageUrl!,
              fit: BoxFit.cover,
              width: Get.width * 0.35,
              height: Get.height * 0.12,
            ),
          ),
          Container(
            width: Get.width * 0.52,
            height: Get.height * 0.12,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              boxShadow: AppColors.shadow,
              color: AppColors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exam.title!,
                  style: TxtStyle.inputStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  exam.description!,
                  maxLines: 1,
                  style: TxtStyle.p,
                  overflow: TextOverflow.ellipsis,
                ),
                Text('Lesson 1: How to install Flutter', style: TxtStyle.text),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
