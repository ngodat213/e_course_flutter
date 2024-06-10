import 'package:e_course_flutter/controller/home_controller.dart';
import 'package:e_course_flutter/screens/home_screen/widget/course_slider.dart';
import 'package:e_course_flutter/screens/home_screen/widget/gridview_course_widget.dart';
import 'package:e_course_flutter/screens/home_screen/widget/list_category_widget.dart';
import 'package:e_course_flutter/screens/home_screen/widget/list_exam_widget.dart';
import 'package:e_course_flutter/screens/home_screen/widget/welcome_user_widget.dart';
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
                    SizedBox(height: 10),
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
}
