import 'package:flutter/material.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/text_styles.dart';

class BuildHeader extends StatelessWidget {
  const BuildHeader({
    super.key,
    required this.text,
    required this.title,
  });
  final String text;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 205,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.main,
        boxShadow: AppColors.shadow,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(35),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 122),
        child: Column(children: [
          Text(text, style: TxtStyle.h1),
          const SizedBox(height: 15),
          Text(title, style: TxtStyle.p),
        ]),
      ),
    );
  }
}
