import 'package:e_course_flutter/controller/home_screen_controller.dart';
import 'package:e_course_flutter/managers/manager_path_routes.dart';
import 'package:e_course_flutter/models/category.dart';
import 'package:e_course_flutter/models/course.dart';
import 'package:get/get.dart';

class CourseListController extends GetxController {
  late List<Course> courses;
  late List<Category> categorys;
  final HomeController _homeController = Get.find<HomeController>();

  @override
  void onInit() {
    courses = _homeController.courses.value;
    categorys = _homeController.categorys.value;
    super.onInit();
  }

  Future<void> onPressCourse(Course obj) async {
    if (obj.id != "") {
      _homeController.currentCourse.value = obj;
      Get.toNamed(ManagerRoutes.courseDetailScreen);
    }
  }
}
