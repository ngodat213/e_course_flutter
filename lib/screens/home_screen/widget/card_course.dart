import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/models/course.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:e_course_flutter/widgets/skeleton_widget.dart';
import 'package:flutter/material.dart';

class CardSlider extends StatelessWidget {
  const CardSlider(
    this.course, {
    super.key,
  });
  final Course course;

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
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              course.courseImage,
              fit: BoxFit.cover,
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
          Positioned(
            bottom: 15,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(course.title,
                      style: TxtStyle.title.copyWith(color: AppColors.white)),
                ),
                Text('${course.lessons.length} ${S.of(context).lesson}',
                    style: TxtStyle.p),
                const SizedBox(height: 5),
                Text(
                  'Hydra',
                  style: TxtStyle.p,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
