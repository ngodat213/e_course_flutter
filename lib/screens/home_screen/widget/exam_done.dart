import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/images.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExamDone extends StatelessWidget {
  const ExamDone({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              margin: const EdgeInsets.only(right: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.main,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Math Final Exam', style: TxtStyle.text),
                Expanded(child: Container()),
                Text('45 ${S.of(context).minutes}', style: TxtStyle.labelStyle),
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
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child:
                      SvgPicture.asset(Images.iconCheck, color: AppColors.main),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
