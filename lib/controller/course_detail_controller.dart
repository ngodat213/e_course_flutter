import 'package:e_course_flutter/api/base_api.dart';
import 'package:e_course_flutter/controller/home_screen_controller.dart';
import 'package:e_course_flutter/managers/manager_address.dart';
import 'package:e_course_flutter/models/course_lesson.dart';
import 'package:e_course_flutter/models/models.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class CourseDetailController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<Course> course = const Course().obs;

  late TabController tabController;
  final HomeController _homeController = Get.find<HomeController>();
  RxList<CourseLesson> currentCourseLesson = RxList<CourseLesson>();

  final BaseAPI _baseAPI = BaseAPI();

  final RxBool _isShowLoading = false.obs;

  bool get isShowLoading => _isShowLoading.value;

  set isShowLoading(bool isShowLoading) {
    _isShowLoading.value = isShowLoading;
  }

  var status = true.obs;

  void toggleTabs() {
    status.value = !status.value;
  }

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    course.value = _homeController.currentCourse.value;
    handleCourseLesson();
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  Future<void> handleCourseLesson() async {
    _isShowLoading.value = true;
    if (course.value.lessons != null) {
      for (var element in course.value.lessons!) {
        await _baseAPI
            .fetchData(ManagerAddress.baseCourseLesson + element,
                method: ApiMethod.GET)
            .then((value) {
          switch (value.apiStatus) {
            case ApiStatus.SUCCEEDED:
              currentCourseLesson
                  .add(CourseLesson.fromDoc(value.object['courseLesson']));
            default:
              {
                printLogError('FAILED');
                Fluttertoast.showToast(msg: "Get data fail");
              }
          }
        });
      }
    }
    _isShowLoading.value = false;
  }
}
