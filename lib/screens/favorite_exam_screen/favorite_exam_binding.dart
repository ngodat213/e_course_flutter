import 'package:e_course_flutter/controller/favorite_exam_controller.dart';
import 'package:get/get.dart';

class FavoriteExamBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoriteExamController>(() => FavoriteExamController());
  }
}
