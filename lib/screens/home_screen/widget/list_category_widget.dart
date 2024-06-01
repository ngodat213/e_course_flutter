import 'package:e_course_flutter/controller/home_screen_controller.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoryWidget extends GetView<HomeController> {
  const ListCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 25),
      height: 30,
      child: ListView.builder(
        itemCount: controller.categorys.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              controller.onPressCategory(
                  controller.categorys[index].id!, index);
            },
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                controller.categorys[index].category!,
                style: TxtStyle.inputStyle.copyWith(
                  fontWeight: index == 0 ? FontWeight.w600 : FontWeight.w500,
                  color: index == 0 ? AppColors.main : AppColors.input,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
