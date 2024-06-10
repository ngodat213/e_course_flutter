import 'package:e_course_flutter/controller/home_controller.dart';
import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/managers/manager_path_routes.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GridViewCourseWidget extends GetView<HomeController> {
  const GridViewCourseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final courses = controller.courses;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          _gridviewCourseTitle(context),
          const SizedBox(height: 8),
          GridView.custom(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: Get.width / 2.7,
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 1.6,
            ),
            childrenDelegate: SliverChildBuilderDelegate(
              childCount: courses.length < 4 ? courses.length : 4,
              (context, index) => GestureDetector(
                onTap: () {
                  controller.onPressCourse(courses[index]);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.width / 2,
                      height: Get.width / 4,
                      decoration: BoxDecoration(
                        boxShadow: AppColors.shadow,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        image: DecorationImage(
                            image: NetworkImage(courses[index].imageIntroduce!),
                            fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      courses[index].title!,
                      style: TxtStyle.text,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(courses[index].teacher!.username!, style: TxtStyle.p),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _gridviewCourseTitle(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(S.of(context).populrarCourse, style: TxtStyle.title),
            GestureDetector(
              onTap: () {
                Get.toNamed(ManagerRoutes.courseListScreen);
              },
              child: Text(
                S.of(context).all,
                style: TxtStyle.p.copyWith(color: AppColors.main),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
