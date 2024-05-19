import 'package:e_course_flutter/controller/home_screen_controller.dart';
import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/managers/manager_path_routes.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:e_course_flutter/widgets/skeleton_widget.dart';
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
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      child: Image.network(
                        courses[index].imageIntroduce!,
                        fit: BoxFit.cover,
                        width: 200,
                        height: 200,
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
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            courses[index].title!,
                            style:
                                TxtStyle.text.copyWith(color: AppColors.white),
                          ),
                          Text(courses[index].teacher!.username!,
                              style: TxtStyle.p),
                        ],
                      ),
                    ),
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
            Text(S.of(context).populraCourse, style: TxtStyle.title),
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
