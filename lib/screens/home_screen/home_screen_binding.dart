import 'package:e_course_flutter/controller/course_detail_controller.dart';
import 'package:e_course_flutter/controller/home_screen_controller.dart';
import 'package:get/get.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(CourseDetailController());
  }
}
