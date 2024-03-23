import 'package:e_course_flutter/controller/course_detail_controller.dart';
import 'package:get/get.dart';

class CourseDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CourseDetailController());
  }
}
