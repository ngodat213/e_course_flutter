import 'package:e_course_flutter/controller/home_screen_controller.dart';
import 'package:e_course_flutter/models/models.dart';
import 'package:e_course_flutter/screens/home_screen/widget/course_slider.dart';
import 'package:e_course_flutter/screens/home_screen/widget/gridview_course_widget.dart';
import 'package:e_course_flutter/screens/home_screen/widget/list_category_widget.dart';
import 'package:e_course_flutter/screens/home_screen/widget/list_exam_widget.dart';
import 'package:e_course_flutter/screens/home_screen/widget/welcome_user_widget.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Obx(
        () => controller.isShowLoading
            ? const Center(child: CircularProgressIndicator())
            : const SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WelcomeUserWidget(),
                    CourseSliderWidget(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListCategoryWidget(),
                        GridViewCourseWidget(),
                        ListExamWidget(),
                      ],
                    ),
                  ],
                ),
              ),
      )),
    );
  }

  Container _listViewTeacher(List<Exam> quizs) {
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
}
