import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_course_flutter/controller/home_screen_controller.dart';
import 'package:e_course_flutter/screens/home_screen/widget/card_course.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseSliderWidget extends GetView<HomeController> {
  const CourseSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
          items: controller.courses
              .take(4)
              .map((e) => GestureDetector(
                  onTap: () {
                    controller.onPressCourse(e);
                  },
                  child: CardSlider(
                    course: e,
                    lessons: const [],
                  )))
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
        Obx(() => _dotIndicator(controller.dotIndicator.value)),
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
}
