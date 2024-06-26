import 'package:e_course_flutter/controller/course_list_controller.dart';
import 'package:e_course_flutter/controller/exam_list_controller.dart';
import 'package:e_course_flutter/controller/home_controller.dart';
import 'package:e_course_flutter/controller/main_controller.dart';
import 'package:e_course_flutter/controller/my_course_controller.dart';
import 'package:e_course_flutter/controller/setting_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put(MainController());
    Get.lazyPut(() => ExamListController());
    Get.lazyPut(() => CourseListController());
    Get.lazyPut(() => MyCourseController());
    Get.lazyPut(() => SettingController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => SettingController());
  }
}
