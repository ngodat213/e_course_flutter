import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/models/models.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/images.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardExam extends StatelessWidget {
  const CardExam({
    super.key,
    required this.quiz,
    required this.image,
  });
  final Exam quiz;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Stack(
        children: [
          Container(
            width: 160,
            height: 200,
            decoration: BoxDecoration(
              color: AppColors.colorFb,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SvgPicture.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 10,
            child: Container(
              width: 135,
              height: 130,
              decoration: const BoxDecoration(
                color: AppColors.main,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      quiz.title!,
                      style: TxtStyle.label.copyWith(color: AppColors.white),
                    ),
                    Expanded(child: Container()),
                    Row(
                      children: [
                        SvgPicture.asset(
                          Images.iconClock,
                          color: AppColors.white,
                        ),
                        const SizedBox(width: 8),
                        // Text(
                        //   '${quiz.lessons!.length} ${S.of(context).lesson}',
                        //   style: TxtStyle.p,
                        // )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
