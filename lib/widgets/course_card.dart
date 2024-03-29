import 'package:flutter/material.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/text_styles.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        boxShadow: AppColors.shadow,
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                width: 70,
                height: 70,
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  color: AppColors.main,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              SizedBox(
                width: 202,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Learning How To Write As A Professional Author',
                        style:
                            TxtStyle.button.copyWith(color: AppColors.input)),
                    const Expanded(child: SizedBox()),
                    const SizedBox(height: 8),
                    Text('Lesson 10', style: TxtStyle.labelStyle),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            right: 10,
            bottom: 0,
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                  color: AppColors.main,
                  borderRadius: BorderRadius.circular(100)),
              child: const Center(
                child: Icon(
                  Icons.play_arrow,
                  color: AppColors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
