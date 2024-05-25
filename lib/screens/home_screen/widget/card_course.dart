import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/models/course.dart';
import 'package:e_course_flutter/models/course_lesson.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:e_course_flutter/widgets/skeleton_widget.dart';
import 'package:flutter/material.dart';

class CardSlider extends StatelessWidget {
  const CardSlider({
    required this.course,
    required this.lessons,
    super.key,
  });
  final Course course;
  final List<CourseLesson> lessons;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      margin: const EdgeInsets.only(top: 18, left: 25, right: 25),
      decoration: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          course.imageIntroduce!,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return const Skeleton(radius: 8);
          },
          errorBuilder: (context, error, stackTrace) {
            return const Skeleton(radius: 8);
          },
        ),
      ),
    );
  }
}
