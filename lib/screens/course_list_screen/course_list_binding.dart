import 'package:e_course_flutter/controller/course_list_controller.dart';
import 'package:get/get.dart';

class CourseListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CourseListController());
  }
}
