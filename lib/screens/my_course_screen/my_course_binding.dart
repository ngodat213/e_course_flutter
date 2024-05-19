import 'package:e_course_flutter/controller/my_course_controller.dart';
import 'package:get/get.dart';

class MyCourseBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MyCourseController());
  }
}
