import 'package:e_course_flutter/controller/exam_play_controller.dart';
import 'package:get/get.dart';

class ExamPlayBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ExamPlayController());
  }
}
