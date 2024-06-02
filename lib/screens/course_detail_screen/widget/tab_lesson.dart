import 'package:e_course_flutter/controller/course_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/models/course_lesson.dart';
import 'package:e_course_flutter/models/course_video.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/images.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:e_course_flutter/widgets/skeleton_widget.dart';
import 'package:get/get.dart';

class TabLesson extends GetView<CourseDetailController> {
  const TabLesson({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => controller.isShowLoading
              ? const Center(child: CircularProgressIndicator())
              : SizedBox(
                  height: Get.height * 0.9,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.courseLessons.length,
                    itemBuilder: (context, index) {
                      if (controller
                          .courseLessons.value[index].videos!.isNotEmpty) {
                        return _tabbarLessonContent(
                            context,
                            controller.courseLessons.value[index],
                            controller.courseLessons.value[index].videos!);
                      }
                      return null;
                    },
                  ),
                ),
        ),
      ],
    );
  }

  Container _tabbarLessonContent(
      BuildContext context, CourseLesson lesson, List<CourseVideo> video) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${S.of(context).section} ${lesson.selection! + 1} - ${lesson.title}',
            style: TxtStyle.hintStyle.copyWith(fontWeight: FontWeight.w600),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: lesson.videos!.length,
            itemBuilder: (context, index) {
              return _lessonButton(context, lesson, video[index]);
            },
          ),
        ],
      ),
    );
  }

  Container _tabbarLessonSkeletonContent(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Skeleton(width: 80),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Skeleton(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  GestureDetector _lessonButton(
      BuildContext context, CourseLesson lesson, CourseVideo video) {
    return GestureDetector(
      onTap: () {
        controller.onPressVideo(video);
      },
      child: Container(
        height: 70,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: AppColors.shadow),
        child: Row(
          children: [
            SizedBox(
              width: 30,
              height: 30,
              child: Center(
                child: Text("${video.part!}",
                    style: TxtStyle.text.copyWith(fontWeight: FontWeight.w600)),
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(video.title!,
                    style: TxtStyle.text.copyWith(fontWeight: FontWeight.w600)),
                const Expanded(child: SizedBox()),
                Text('${video.hour}hour ${video.minute}min',
                    style: TxtStyle.p.copyWith(color: AppColors.label)),
              ],
            ),
            const Spacer(),
            SvgPicture.asset(Images.iconCheckPadding),
          ],
        ),
      ),
    );
  }
}
