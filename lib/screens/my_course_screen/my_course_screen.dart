import 'package:e_course_flutter/controller/my_course_controller.dart';
import 'package:e_course_flutter/screens/my_course_screen/widgets/my_course_widget.dart';
import 'package:e_course_flutter/screens/my_course_screen/widgets/recommend_widget.dart';
import 'package:e_course_flutter/screens/my_course_screen/widgets/search_course_widget.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCourseScreen extends GetView<MyCourseController> {
  const MyCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Let\'s start learning', style: TxtStyle.p),
                        Text('My course', style: TxtStyle.title),
                      ],
                    ),
                  ),
                  const SearchCourseWidget(),
                  const SizedBox(height: 10),
                  const MyCourseWidget(),
                  const SizedBox(height: 15),
                  const RecommentWidget(),
                  const SizedBox(height: 70),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
