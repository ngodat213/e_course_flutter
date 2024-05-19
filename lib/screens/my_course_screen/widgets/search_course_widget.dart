import 'package:e_course_flutter/controller/course_list_controller.dart';
import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchCourseWidget extends GetView<CourseListController> {
  const SearchCourseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        boxShadow: AppColors.shadow,
        color: AppColors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: TextFormField(
        onChanged: (value) => controller.onChangedSearch(value),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 17),
          prefixIcon: const Icon(Icons.search),
          hintText: S.of(context).searchTitle,
          hintStyle: TxtStyle.description,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
