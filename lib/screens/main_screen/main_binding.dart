import 'package:e_course_flutter/controller/course_list_controller.dart';
import 'package:e_course_flutter/controller/home_screen_controller.dart';
import 'package:e_course_flutter/controller/main_controller.dart';
import 'package:e_course_flutter/controller/my_course_controller.dart';
import 'package:e_course_flutter/controller/setting_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(CourseListController());
    Get.put(MyCourseController());
    Get.put(SettingController());
    Get.put(HomeController());
  }
}
