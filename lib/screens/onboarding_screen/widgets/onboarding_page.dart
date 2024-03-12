import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:e_course_flutter/widgets/base_text.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String svgPath;
  const OnboardingPage({
    super.key,
    required this.title,
    required this.description,
    required this.svgPath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      child: Column(
        children: [
          Container(
            height: Get.height * 0.65,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(svgPath),
                scale: 1.75,
              ),
            ),
          ),
          Container(
            height: Get.height * 0.35,
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: AppColors.white,
            ),
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BaseText(
                  text: title,
                  textAlign: TextAlign.center,
                  style: TxtStyle.h2,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                ),
                const SizedBox(height: 30),
                BaseText(
                  text: description,
                  textAlign: TextAlign.center,
                  style: TxtStyle.p.copyWith(color: AppColors.label),
                  duration: const Duration(milliseconds: 1500),
                  curve: Curves.easeInOut,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
