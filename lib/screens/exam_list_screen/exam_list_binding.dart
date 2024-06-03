import 'package:e_course_flutter/controller/exam_list_controller.dart';
import 'package:get/get.dart';

class ExamListBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ExamListController());
  }
}
