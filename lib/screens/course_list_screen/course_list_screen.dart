import 'package:e_course_flutter/controller/course_list_controller.dart';
import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/models/course.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:e_course_flutter/widgets/base_text.dart';
import 'package:e_course_flutter/widgets/skeleton_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseListScreen extends GetView<CourseListController> {
  const CourseListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Course for you!', style: TxtStyle.p),
                    Text('List course', style: TxtStyle.title),
                  ],
                ),
              ),
              _searchCourse(context),
              _listCategory(),
              _gridviewCourse(controller.courses),
              const SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _appbar(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.65,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BaseText(
            text: S.of(context).myCourse,
            textAlign: TextAlign.center,
            style: TxtStyle.h3.copyWith(color: AppColors.input),
            duration: const Duration(milliseconds: 1500),
            curve: Curves.easeInOut,
          ),
          BaseText(
            text: 'Start searching for courses',
            textAlign: TextAlign.center,
            style: TxtStyle.p.copyWith(color: AppColors.label),
            duration: const Duration(milliseconds: 1500),
            curve: Curves.easeInOut,
          )
        ],
      ),
    );
  }

  Container _searchCourse(BuildContext context) {
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
        // onChanged: (value) => _runFilter(value),
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

  Container _gridviewCourse(List<Course> courses) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: GridView.custom(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: 1.6,
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          childCount: courses.length,
          (context, index) => GestureDetector(
            onTap: () {},
            child: _cardCourse(courses, index),
          ),
        ),
      ),
    );
  }

  Stack _cardCourse(List<Course> courses, int index) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          child: Image.network(
            courses[index].courseImage,
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
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                courses[index].title,
                style: TxtStyle.text.copyWith(color: AppColors.white),
              ),
              Text('Hydra', style: TxtStyle.p),
            ],
          ),
        ),
      ],
    );
  }

  Container _listCategory() {
    const listCategory = [
      'All',
      'C++',
      'C#',
      'Python',
      'Javascript',
      'HTML',
      'Android',
      'Flutter',
    ];
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 25),
      height: 30,
      child: ListView.builder(
        itemCount: listCategory.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // widget.onPressedExam.call(quizs[index]);
            },
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                listCategory[index],
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
