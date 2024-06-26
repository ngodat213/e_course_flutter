import 'package:e_course_flutter/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:get/get.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Text(title,
            style: TxtStyle.button.copyWith(color: AppColors.input)),
      ),
    );
  }
}
