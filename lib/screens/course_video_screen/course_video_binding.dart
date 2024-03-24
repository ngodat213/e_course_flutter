import 'package:e_course_flutter/controller/course_video_controller.dart';
import 'package:get/get.dart';

class CourseVideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CourseVideoController());
  }
}
