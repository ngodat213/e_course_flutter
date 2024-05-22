import 'package:e_course_flutter/controller/my_course_controller.dart';
import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecommentWidget extends GetView<MyCourseController> {
  const RecommentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Text(S.of(context).recommended, style: TxtStyle.title),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          height: Get.height * 0.25,
          child: ListView.builder(
            itemCount: controller.courses.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  controller.onPressCourse(controller.courses[index]);
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    boxShadow: AppColors.shadow,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25)),
                            child: Image.network(
                              width: Get.width * 0.6,
                              height: Get.height * 0.12,
                              fit: BoxFit.cover,
                              controller.courses[index].imageIntroduce!,
                            ),
                          ),
                          Container(
                            width: Get.width * 0.6,
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.courses[index].teacher!.username!,
                                  style: TxtStyle.text.copyWith(
                                    color: AppColors.label,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  controller.courses[index].title!,
                                  style: TxtStyle.button,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  controller.courses[index].description!,
                                  style: TxtStyle.p,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        left: Get.width * 0.45,
                        top: Get.height * 0.1,
                        child: Container(
                          width: Get.width * 0.1,
                          height: Get.width * 0.1,
                          decoration: BoxDecoration(
                            color: AppColors.main,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.play_arrow_rounded,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
