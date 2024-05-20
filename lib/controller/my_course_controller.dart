import 'package:e_course_flutter/api/base_api.dart';
import 'package:e_course_flutter/controller/main_controller.dart';
import 'package:e_course_flutter/managers/manager_address.dart';
import 'package:e_course_flutter/models/course.dart';
import 'package:get/get.dart';

class MyCourseController extends GetxController {
  final MainController _mainController = Get.find<MainController>();

  late List<Course> courses;

  List<Course> myCourses = [];

  final BaseAPI _baseAPI = BaseAPI();

  final RxBool _isShowLoading = false.obs;

  bool get isShowLoading => _isShowLoading.value;

  set isShowLoading(bool isShowLoading) {
    _isShowLoading.value = isShowLoading;
  }

  @override
  void onInit() async {
    _isShowLoading.value = true;
    // await handleMyCourse();
    handleCourse();
    _isShowLoading.value = false;
    super.onInit();
  }

  Future<void> handleMyCourse() async {
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
  }

  void handleCourse() {
    courses = _mainController.courses;
    courses.removeWhere((course) => myCourses.contains(course));
  }
}
