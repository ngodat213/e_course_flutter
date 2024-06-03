import 'package:e_course_flutter/controller/exam_list_controller.dart';
import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/models/exam.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:e_course_flutter/widgets/back_button.dart';
import 'package:e_course_flutter/widgets/base_text.dart';
import 'package:e_course_flutter/widgets/title_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExamListScreen extends GetView<ExamListController> {
  const ExamListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 90),
                  _searchExam(context),
                  _listCategory(),
                  Obx(() {
                    return _gridviewCourse(controller.examSearch);
                  }),
                  const SizedBox(height: 70),
                ],
              ),
              TitleScreen(title: S.of(context).populrarExam),
              BuildBackButton(top: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchExam(BuildContext context) {
    return Container(
      height: 50,
      width: Get.width,
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
          hintText: S.of(context).searchTitleExam,
          hintStyle: TxtStyle.description,
          border: InputBorder.none,
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

  Container _gridviewCourse(List<Exam> exams) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: GridView.custom(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 150,
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: 1.6,
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          childCount: exams.length,
          (context, index) => GestureDetector(
            onTap: () {
              controller.onPressExam(exams[index]);
            },
            child: _cardCourse(exams, index),
          ),
        ),
      ),
    );
  }

  Widget _cardCourse(List<Exam> exams, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: Get.width / 2,
          height: Get.width / 4,
          decoration: BoxDecoration(
            boxShadow: AppColors.shadow,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            image: DecorationImage(
                image: NetworkImage(exams[index].imageUrl!), fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          exams[index].title!,
          style: TxtStyle.text,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Container _listCategory() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 25),
      height: 30,
      child: ListView.builder(
        itemCount: controller.categorys.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              controller.onChangedCategory(
                  controller.categorys[index].id!, index);
            },
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Obx(
                () {
                  return Text(
                    controller.categorys[index].category!,
                    style: TxtStyle.inputStyle.copyWith(
                      fontWeight: index == controller.currentCategory.value
                          ? FontWeight.w600
                          : FontWeight.w500,
                      color: index == controller.currentCategory.value
                          ? AppColors.main
                          : AppColors.input,
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
