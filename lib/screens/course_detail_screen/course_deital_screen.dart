import 'package:e_course_flutter/models/course_lesson.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/models/models.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/images.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:e_course_flutter/widgets/back_button.dart';
import 'package:e_course_flutter/widgets/build_button.dart';
import 'package:e_course_flutter/widgets/title_screen.dart';
import 'package:readmore/readmore.dart';

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({super.key});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Course course = const Course(
      uid: "3",
      teacherId: "teacher3",
      courseImage:
          "https://www.wearetechtonic.com/wp-content/uploads/2020/06/Flutter-App-Development.png",
      title: "Course 3",
      description: "Description for Course 3",
      time: "6:00 PM - 8:00 PM",
      lessons: ["Lesson 1", "Lesson 2", "Lesson 3", "Lesson 4"],
      category: "Category 3",
      rating: 4.8,
      feedbacks: ["Feedback 1"],
      register: 90,
    );

    const courseLesson = [
      CourseLesson(
        uid: 'lesson1_uid',
        selection: 1,
        title: 'Lesson 1: Introduction',
        videos: ['video1', 'video2'],
      ),
      CourseLesson(
        uid: 'lesson2_uid',
        selection: 2,
        title: 'Lesson 2: Advanced Topics',
        videos: ['video3', 'video4'],
      ),
      CourseLesson(
        uid: 'lesson2_uid',
        selection: 2,
        title: 'Lesson 2: Advanced Topics',
        videos: ['video3', 'video4'],
      ),
    ];
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
                    _thumbCourse(context, course),
                    const SizedBox(height: 32),
                    _titleCourse(course),
                    _teacherInfo(course.teacherId),
                    const SizedBox(height: 16),
                    _courseDescription(course, context),
                    const SizedBox(height: 32),
                    // _tabbarCourseDetail(context, courseLesson),
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

  Widget _registerButton(BuildContext context) {
    return BuildButton(
      text: S.of(context).register,
      onTap: () {},
      duration: const Duration(seconds: 2),
      curve: Curves.easeInOut,
    );
  }

  Widget _thumbCourse(BuildContext context, Course course) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width - 50,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(course.courseImage),
          fit: BoxFit.cover,
        ),
        color: AppColors.main,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  Widget _titleCourse(Course course) => Text(course.title, style: TxtStyle.h3);

  Widget _teacherInfo(String teacher) {
    return Row(
      children: [
        Text(
          "@$teacher",
          style: TxtStyle.pBold.copyWith(color: const Color(0xFF93989A)),
        ),
        const SizedBox(width: 4),
        SvgPicture.asset(Images.iconCheckMark),
      ],
    );
  }

  Widget _courseDescription(Course course, BuildContext context) {
    return ReadMoreText(
      course.description,
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

  // Widget _tabbarCourseDetail(
  //   BuildContext context,
  //   List<CourseLesson> courseLesson,
  // ) {
  //   return SizedBox(
  //     height: MediaQuery.of(context).size.height,
  //     child: Column(
  //       children: [
  //         TabBar(
  //           unselectedLabelColor: AppColors.label,
  //           labelColor: Colors.black,
  //           indicatorColor: AppColors.white,
  //           indicator: const BoxDecoration(
  //             border: Border(
  //               bottom: BorderSide(
  //                 color: AppColors.main,
  //                 width: 2.0,
  //               ),
  //             ),
  //           ),
  //           controller: tabController,
  //           tabs: [
  //             Tab(text: S.of(context).lesson),
  //             Tab(text: S.of(context).review),
  //           ],
  //         ),
  //         Expanded(
  //           child: TabBarView(
  //             controller: tabController,
  //             children: [
  //               TabLesson(
  //                 courseLesson: courseLesson,
  //                 // onPressedLesson: onPressedLesson,
  //               ),
  //               const TabReview(),
  //             ],
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
