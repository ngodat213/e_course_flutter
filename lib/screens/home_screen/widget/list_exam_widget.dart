import 'package:e_course_flutter/controller/home_screen_controller.dart';
import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/screens/home_screen/widget/card_exam.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListExamWidget extends GetView<HomeController> {
  const ListExamWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final exams = controller.exams;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(S.of(context).todayTest, style: TxtStyle.title),
          const SizedBox(height: 8),
          Text(S.of(context).todayTestTitle, style: TxtStyle.hintStyle),
          const SizedBox(height: 8),
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: exams.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    controller.onPressExam(exams[index]);
                  },
                  child: CardExam(
                    quiz: exams[index],
                    image: 'lib/res/images/read_image$index.svg',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
