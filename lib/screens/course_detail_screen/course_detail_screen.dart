import 'package:chewie/chewie.dart';
import 'package:e_course_flutter/controller/course_detail_controller.dart';
import 'package:e_course_flutter/screens/course_detail_screen/widget/tab_lesson.dart';
import 'package:e_course_flutter/screens/course_detail_screen/widget/tab_review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/images.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:e_course_flutter/widgets/back_button.dart';
import 'package:e_course_flutter/widgets/build_button.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class CourseDetailScreen extends GetView<CourseDetailController> {
  const CourseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white.withOpacity(0.1),
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: _registerButton(context),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 60),
                    _videoPlayer(),
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
            ],
          ),
        ),
      ),
    );
  }

  FutureBuilder<void> _videoPlayer() {
    return FutureBuilder(
      future: controller.initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: AspectRatio(
              aspectRatio: controller.videoPlayerController.value.aspectRatio,
              child: Chewie(controller: controller.chewieController),
            ),
          );
        } else {
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
      },
    );
  }

  Widget _registerButton(BuildContext context) {
    return BuildButton(
      text: S.of(context).register,
      onTap: () {},
      duration: const Duration(seconds: 2),
      curve: Curves.easeInOut,
    );
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
    return ReadMoreText(
      controller.course.value.description!,
      trimLines: 2,
      trimCollapsedText: S.of(context).readmore,
      trimExpandedText: S.of(context).showless,
      style: TxtStyle.text.copyWith(color: const Color(0xFF93989A)),
    );
  }

  Widget _favoriteButton(BuildContext context) {
    return Positioned(
      top: 24,
      right: 25,
      child: GestureDetector(
        onTap: () {
          // context.read<CourseDetailCubit>().updateFavorite();
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
            child:
                // state.favorite == false
                const Icon(
              Icons.favorite,
              color: Colors.grey,
              size: 16,
            )
            // : const Icon(
            //     Icons.favorite,
            //     color: Colors.red,
            //     size: 16,
            //   ),
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
