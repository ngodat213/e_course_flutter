import 'package:e_course_flutter/controller/course_detail_controller.dart';
import 'package:e_course_flutter/screens/course_detail_screen/widget/register_button.dart';
import 'package:e_course_flutter/screens/course_detail_screen/widget/tab_lesson.dart';
import 'package:e_course_flutter/screens/course_detail_screen/widget/tab_review.dart';
import 'package:e_course_flutter/screens/course_detail_screen/widget/video_player.dart';
import 'package:e_course_flutter/widgets/readmore_html.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/images.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:e_course_flutter/widgets/back_button.dart';
import 'package:get/get.dart';

class CourseDetailScreen extends GetView<CourseDetailController> {
  const CourseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Obx(
          () => controller.isOrder.value
              ? const SizedBox()
              : const RegisterButton(),
        ),
        body: SafeArea(
            child: Obx(() => controller.isShowLoading
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Stack(children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 60),
                          const VideoPlayWidget(),
                          const SizedBox(height: 32),
                          _titleCourse(),
                          _teacherInfo(),
                          const SizedBox(height: 16),
                          _courseDescription(context),
                          const SizedBox(height: 32),
                          _tabbarCourseDetail(context),
                        ],
                      ),
                    ),
                    _favoriteButton(context),
                    BuildBackButton(top: 24),
                  ])))));
  }

  Widget _thumbCourse(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width - 50,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(controller.course.value.imageIntroduce!),
          fit: BoxFit.cover,
        ),
        color: AppColors.main,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  Widget _titleCourse() => Text(
        controller.course.value.title!,
        style: TxtStyle.h3,
      );

  Widget _teacherInfo() {
    return Row(
      children: [
        Text(
          "@${controller.course.value.teacher!.username}",
          style: TxtStyle.pBold.copyWith(color: const Color(0xFF93989A)),
        ),
        const SizedBox(width: 4),
        SvgPicture.asset(Images.iconCheckMark),
      ],
    );
  }

  Widget _courseDescription(BuildContext context) {
    return ReadMoreHtml(
      htmlContent: controller.course.value.description!,
      trimLines: 2,
      trimCollapsedText: 'Read more',
      trimExpandedText: 'Show less',
      style: TxtStyle.text.copyWith(color: const Color(0xFF93989A)),
    );
  }

  Widget _favoriteButton(BuildContext context) {
    return Positioned(
      top: 24,
      right: 25,
      child: GestureDetector(
        onTap: () {
          controller.onPressFav();
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            boxShadow: AppColors.shadow,
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Obx(
            () => Icon(
              controller.isFav.value ? Icons.favorite : Icons.favorite_border,
              color: controller.isFav.value ? Colors.red : Colors.grey,
              size: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget _tabbarCourseDetail(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          TabBar(
            unselectedLabelColor: AppColors.label,
            labelColor: Colors.black,
            indicatorColor: AppColors.white,
            indicator: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.main,
                  width: 2.0,
                ),
              ),
            ),
            controller: controller.tabController,
            tabs: [
              Tab(text: S.of(context).lesson),
              Tab(text: S.of(context).review),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              children: const [
                TabLesson(),
                TabReview(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
