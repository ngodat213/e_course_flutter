import 'dart:async';

import 'package:e_course_flutter/api/base_api.dart';
import 'package:e_course_flutter/controller/home_controller.dart';
import 'package:e_course_flutter/controller/main_controller.dart';
import 'package:e_course_flutter/managers/manager_address.dart';
import 'package:e_course_flutter/managers/manager_path_routes.dart';
import 'package:e_course_flutter/models/category.dart';
import 'package:e_course_flutter/models/course.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class CourseListController extends GetxController {
  final MainController _mainController = Get.find<MainController>();
  final HomeController _homeController = Get.find<HomeController>();
  late List<Course> courses;
  late List<Category> categorys;
  late RxList<Course> courseSearch;

  Timer? _debounce;
  RxInt currentCategory = 0.obs;

  final BaseAPI _baseAPI = BaseAPI();

  final RxBool _isShowLoading = false.obs;

  bool get isShowLoading => _isShowLoading.value;

  set isShowLoading(bool isShowLoading) {
    _isShowLoading.value = isShowLoading;
  }

  @override
  void onInit() {
    getCategoryIndex();
    courses = _mainController.courses;
    courseSearch = _mainController.courses;
    categorys = _mainController.categorys;
    super.onInit();
  }

  @override
  void onClose() {
    _debounce?.cancel();
    super.onClose();
  }

  Future<void> onPressCourse(Course obj) async {
    if (obj.id != "") {
      _homeController.currentCourse.value = obj;
      Get.toNamed(ManagerRoutes.courseDetailScreen);
    }
  }

  void getCategoryIndex() {
    currentCategory.value = _homeController.currentCategoryCourse.value;
    if (_homeController.currentCategoryCourseId.value != "") {
      handleCategory(_homeController.currentCategoryCourseId.value);
    }
  }

  void onPressCategory(String id, int index) {
    currentCategory.value = index;
    handleCategory(id);
  }

  void handleCategory(String id) {
    _baseAPI.fetchData(ManagerAddress.baseCourse,
        params: {"category": id}).then((value) async {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            courseSearch.value =
                List<Course>.from(value.object.map((x) => Course.fromJson(x)));
          }
        default:
          {
            printLogError('FAILED');
            Fluttertoast.showToast(msg: "Get data fail");
          }
      }
    });
  }

  void onChangedSearch(String value) async {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(seconds: 3), () {
      _baseAPI.fetchData(ManagerAddress.baseCourse, params: {"q": value}).then(
          (value) async {
        switch (value.apiStatus) {
          case ApiStatus.SUCCEEDED:
            {
              courseSearch.value = List<Course>.from(
                  value.object.map((x) => Course.fromJson(x)));
            }
          default:
            {
              printLogError('FAILED');
              Fluttertoast.showToast(msg: "Get data fail");
            }
        }
      });
    });
  }
}
