import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/models/course.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/images.dart';
import 'package:e_course_flutter/themes/text_styles.dart';

class CourseCardListView extends StatelessWidget {
  const CourseCardListView(this.course, {super.key});
  final Course course;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 132,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        boxShadow: AppColors.shadow,
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            width: 108,
            height: 108,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: AppColors.main,
              image: DecorationImage(
                  image: NetworkImage(course.courseImage), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          SizedBox(
            width: 202,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(course.title,
                    style: TxtStyle.button.copyWith(color: AppColors.input)),
                const Expanded(child: SizedBox()),
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1, color: Color(0xFFEDEDED)),
                    ),
                  ),
                  child: _CourseInfo(course),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: AppColors.main,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    Text('@${course.teacherId}', style: TxtStyle.labelStyle)
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CourseInfo extends StatelessWidget {
  const _CourseInfo(this.course);
  final Course course;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(Images.iconLesson),
            const SizedBox(width: 8),
            Text('${course.lessons.length} ${S.of(context).lesson}',
                style: TxtStyle.time.copyWith(fontWeight: FontWeight.w500)),
          ],
        ),
      ],
    );
  }
}
