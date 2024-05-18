import 'package:e_course_flutter/controller/exam_detail_controller.dart';
import 'package:get/get.dart';

class ExamDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ExamDetailController());
  }
}
