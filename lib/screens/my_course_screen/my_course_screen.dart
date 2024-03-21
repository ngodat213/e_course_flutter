import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/models/course.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:e_course_flutter/widgets/title_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Course> courses = [
      const Course(
        uid: "1",
        teacherId: "teacher1",
        courseImage:
            "https://www.wearetechtonic.com/wp-content/uploads/2020/06/Flutter-App-Development.png",
        title: "Course 1",
        description: "Description for Course 1",
        time: "10:00 AM - 12:00 PM",
        lessons: ["Lesson 1", "Lesson 2", "Lesson 3"],
        category: "Category 1",
        rating: 4.5,
        feedbacks: ["Feedback 1", "Feedback 2"],
        register: 100,
      ),
      const Course(
        uid: "2",
        teacherId: "teacher2",
        courseImage:
            "https://www.wearetechtonic.com/wp-content/uploads/2020/06/Flutter-App-Development.png",
        title: "Course 2",
        description: "Description for Course 2",
        time: "2:00 PM - 4:00 PM",
        lessons: ["Lesson 1", "Lesson 2"],
        category: "Category 2",
        rating: 4.2,
        feedbacks: ["Feedback 1", "Feedback 2", "Feedback 3"],
        register: 120,
      ),
      const Course(
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
      ),
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 70),
                  _searchCourse(context),
                  const SizedBox(height: 10),
                  _myCourseList(courses),
                  const SizedBox(height: 15),
                  _recommendCourse(context, courses),
                  const SizedBox(height: 70),
                ],
              ),
              TitleScreen(title: S.of(context).myCourse),
            ],
          ),
        ),
      ),
    );
  }

  Column _recommendCourse(BuildContext context, List<Course> courses) {
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
            itemCount: courses.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // widget.onPressedExam.call(quizs[index]);
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
                              courses[index].courseImage,
                            ),
                          ),
                          Container(
                            width: Get.width * 0.6,
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '1h30m',
                                  style: TxtStyle.text.copyWith(
                                    color: AppColors.label,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  'Flutter for beginer',
                                  style: TxtStyle.button,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  courses[index].description,
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

  Column _myCourseList(List<Course> courses) {
    return Column(
      children: courses
          .map(
            (e) => Container(
              margin: const EdgeInsets.fromLTRB(25, 10, 25, 0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                    child: Image.network(
                      e.courseImage,
                      fit: BoxFit.cover,
                      width: Get.width * 0.35,
                      height: Get.height * 0.12,
                    ),
                  ),
                  Container(
                    width: Get.width * 0.52,
                    height: Get.height * 0.12,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      boxShadow: AppColors.shadow,
                      color: AppColors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              e.title,
                              style: TxtStyle.inputStyle,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              '- 1h30m',
                              style: TxtStyle.inputStyle.copyWith(
                                color: AppColors.main,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Text(
                          e.description,
                          maxLines: 1,
                          style: TxtStyle.p,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text('Lesson 1: How to install Flutter',
                            style: TxtStyle.text),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
