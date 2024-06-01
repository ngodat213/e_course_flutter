import 'package:e_course_flutter/controller/my_course_controller.dart';
import 'package:e_course_flutter/models/course.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class MyCourseWidget extends GetView<MyCourseController> {
  const MyCourseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isShowLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: controller.myCourses
                  .map(
                    (e) => GestureDetector(
                      onTap: () {
                        controller.onPressCourse(e);
                      },
                      child: MyCourseCard(course: e),
                    ),
                  )
                  .toList(),
            ),
    );
  }
}

class MyCourseCard extends StatelessWidget {
  const MyCourseCard({
    required this.course,
    super.key,
  });
  final Course course;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(25, 10, 25, 0),
      decoration: const BoxDecoration(
        color: AppColors.white,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
            child: Image.network(
              course.imageIntroduce!,
              fit: BoxFit.cover,
              width: Get.width * 0.35,
              height: Get.height * 0.12,
            ),
          ),
          Container(
            width: Get.width * 0.52,
            height: Get.height * 0.12,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: const BoxDecoration(
              color: AppColors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.title!,
                  style: TxtStyle.inputStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  course.teacher!.username!,
                  style: TxtStyle.p,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Html(
                  data: course.description,
                  style: {
                    "p": Style(
                      margin: Margins.zero,
                      textOverflow: TextOverflow.ellipsis,
                      fontSize: FontSize(12.0),
                    ),
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
