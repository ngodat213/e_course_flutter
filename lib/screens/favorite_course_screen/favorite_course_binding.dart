import 'package:e_course_flutter/controller/favorite_course_controller.dart';
import 'package:get/get.dart';

class FavoriteCourseBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoriteCourseController>(() => FavoriteCourseController());
  }
}
