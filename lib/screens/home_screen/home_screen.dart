import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_course_flutter/controller/home_screen_controller.dart';
import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/managers/manager_path_routes.dart';
import 'package:e_course_flutter/models/models.dart';
import 'package:e_course_flutter/screens/home_screen/widget/card_course.dart';
import 'package:e_course_flutter/screens/home_screen/widget/card_exam.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:e_course_flutter/widgets/skeleton_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Quiz> quizs = [
      const Quiz(
        uid: '1',
        title: 'Introduction to ',
        image: 'intro_programming.jpg',
        description: 'Learn the basics ',
        type: 'Beginner',
        lessons: ['Lesson 1', 'Lesson 2', 'Lesson 3'],
      ),
      const Quiz(
        uid: '2',
        title: 'Data Structures ',
        image: 'data_structures.jpg',
        description: 'Explore fundamental ',
        type: 'Intermediate',
        lessons: ['Lesson 1', 'Lesson 2', 'Lesson 3', 'Lesson 4'],
      ),
      const Quiz(
        uid: '3',
        title: 'Web Development',
        image: 'web_development.jpg',
        description: 'Learn to build ',
        type: 'Intermediate',
        lessons: ['HTML Basics', 'CSS Styling', 'JavaScript Fundamentals'],
      ),
      const Quiz(
        uid: '4',
        title: 'Machine Learning',
        image: 'machine_learning.jpg',
        description: 'Explore the world ',
        type: 'Advanced',
        lessons: [
          'Introduction to ML',
          'Supervised Learning',
          'Unsupervised Learning',
          'Deep Learning'
        ],
      ),
    ];
    print("Home screen ${controller.currentAccount.username}");
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _welcomeUser(context, controller.currentAccount),
              _courseSilder(controller.courses),
              Obx(() => _dotIndicator(controller.dotIndicator.value)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _listCategory(),
                  _gridviewCourse(context, controller.courses),
                  _listViewTeacher(quizs),
                  // _listExams(context, quizs),
                  _listBlog(quizs),
                ],
              ),
            ],
          ),
        ),
      ),
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

  Container _listBlog(List<Quiz> quizs) {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      padding: const EdgeInsets.symmetric(horizontal: 25),
      color: AppColors.main,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
          Text('Blog', style: TxtStyle.title.copyWith(color: AppColors.white)),
          const SizedBox(height: 8),
          SizedBox(
            height: Get.height * 0.25,
            child: ListView.builder(
              itemCount: quizs.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // widget.onPressedExam.call(quizs[index]);
                  },
                  child: Container(
                    width: Get.width * 0.45,
                    height: Get.height * 0.25,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: Get.height * 0.15,
                          width: Get.width,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8)),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'https://scontent.fsgn2-5.fna.fbcdn.net/v/t39.30808-1/431748094_1579360056191638_9162859787187610457_n.jpg?stp=dst-jpg_p240x240&_nc_cat=104&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHusFhqSM3AO_EGy2lQW9EpmvWWzUXwWUGa9ZbNRfBZQRjhoa-v3mImqudPUzKO20VMH77F496rqzohYnMUCBAG&_nc_ohc=DZiA2vspbAwAX8Mj4ho&_nc_ht=scontent.fsgn2-5.fna&oh=00_AfBvI-x-AS_EL2R4FrvDCsHcUq2CqsPEoi81ccqPutlQ1Q&oe=65FC85DE'))),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          child: RichText(
                              text: TextSpan(
                                  text: 'Hydra: ',
                                  style: TxtStyle.p.copyWith(
                                      color: AppColors.input,
                                      fontWeight: FontWeight.w600),
                                  children: [
                                TextSpan(
                                  text:
                                      'Hello I\'m NgoDat my work is Mobile Developer',
                                  style: TxtStyle.p,
                                )
                              ])),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            'Readmore >',
                            style: TxtStyle.p.copyWith(color: AppColors.main),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }

  Container _listViewTeacher(List<Quiz> quizs) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text('Teacher For You', style: TxtStyle.title),
          const SizedBox(height: 8),
          SizedBox(
            height: Get.height * 0.1,
            child: ListView.builder(
              itemCount: quizs.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // widget.onPressedExam.call(quizs[index]);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 2, color: AppColors.main),
                    ),
                    width: Get.width * 0.45,
                    height: Get.height * 0.1,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Hydra Coder'),
                            Text('Upto 50% OFF'),
                          ],
                        ),
                        SizedBox(width: 20),
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://scontent.fsgn2-5.fna.fbcdn.net/v/t39.30808-6/431748094_1579360056191638_9162859787187610457_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHusFhqSM3AO_EGy2lQW9EpmvWWzUXwWUGa9ZbNRfBZQRjhoa-v3mImqudPUzKO20VMH77F496rqzohYnMUCBAG&_nc_ohc=QWiVaDipxmEAX-ODRIa&_nc_ht=scontent.fsgn2-5.fna&oh=00_AfBkQnn2dfcMcWY3-O2AdqxODTO7Zjsj7rw3FIdg1tmesw&oe=65F6BDA0'),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _listExams(BuildContext context, List<Quiz> quizs) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(S.of(context).todayTest, style: TxtStyle.title),
          const SizedBox(height: 8),
          Text(S.of(context).todayTestTitle, style: TxtStyle.hintStyle),
          const SizedBox(height: 8),
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: quizs.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // widget.onPressedExam.call(quizs[index]);
                  },
                  child: CardExam(
                    quiz: quizs[index],
                    image: 'lib/res/images/read_image$index.svg',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Container _gridviewCourse(BuildContext context, List<Course> courses) {
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
                onTap: () {},
                child: Stack(
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            courses[index].title,
                            style:
                                TxtStyle.text.copyWith(color: AppColors.white),
                          ),
                          Text('Hydra', style: TxtStyle.p),
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

  Widget _courseSilder(List<Course> courses) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
          items: courses
              .map((e) => GestureDetector(
                  onTap: () {
                    Get.toNamed(ManagerRoutes.courseDetailScreen);
                  },
                  child: CardSlider(e)))
              .toList(),
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              controller.dotIndicator.value = index;
            },
          ),
        ),
      ],
    );
  }

  Widget _dotIndicator(int index) {
    return Center(
      child: DotsIndicator(
        dotsCount: 4,
        position: index,
        decorator: DotsDecorator(
          color: AppColors.grey,
          activeColor: AppColors.main,
          size: const Size.square(5),
          activeSize: const Size(5, 5),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }

  Widget _welcomeUser(BuildContext context, User user) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${S.of(context).hi}, ${user.username}', style: TxtStyle.title),
          const SizedBox(height: 2),
          Text(S.of(context).progressTitle, style: TxtStyle.hintStyle),
        ],
      ),
    );
  }
}
