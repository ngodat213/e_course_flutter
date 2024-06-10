import 'package:e_course_flutter/api/base_api.dart';
import 'package:e_course_flutter/controller/home_controller.dart';
import 'package:e_course_flutter/controller/main_controller.dart';
import 'package:e_course_flutter/managers/manager_address.dart';
import 'package:e_course_flutter/models/course.dart';
import 'package:get/get.dart';

class MyCourseController extends GetxController {
  final MainController _mainController = Get.find<MainController>();
  final HomeController _homeController = Get.find<HomeController>();

  late List<Course> courses;

  RxList<Course> myCourses = RxList<Course>();

  final BaseAPI _baseAPI = BaseAPI();

  final RxBool _isShowLoading = false.obs;

  bool get isShowLoading => _isShowLoading.value;

  set isShowLoading(bool isShowLoading) {
    _isShowLoading.value = isShowLoading;
  }

  @override
  void onInit() async {
    _isShowLoading.value = true;
    await handleMyCourse();
    _isShowLoading.value = false;
    super.onInit();
  }

  Future<void> handleMyCourse() async {
    _isShowLoading.value = true;
    for (var e in _mainController.currentAccount.value.courses!) {
      _baseAPI.fetchData(ManagerAddress.baseCourse + e).then((value) async {
        switch (value.apiStatus) {
          case ApiStatus.SUCCEEDED:
            {
              myCourses.add(Course.fromJson(value.object));
            }
        }
      });
    }
    handleCourse();
    _isShowLoading.value = false;
  }

  void onPressCourse(Course obj) {
    _homeController.onPressCourse(obj);
  }

  void handleCourse() {
    courses =
        List.from(_mainController.courses); // Make a copy of the original list
    List<String?> myCourseIds = myCourses.map((course) => course.id).toList();

    // Remove courses from the copied list that have an ID in myCourses
    courses.removeWhere((course) => myCourseIds.contains(course.id));
  }
}
