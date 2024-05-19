import 'dart:async';

import 'package:e_course_flutter/api/base_api.dart';
import 'package:e_course_flutter/controller/main_controller.dart';
import 'package:e_course_flutter/managers/manager_address.dart';
import 'package:e_course_flutter/managers/manager_path_routes.dart';
import 'package:e_course_flutter/models/category.dart';
import 'package:e_course_flutter/models/course.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class CourseListController extends GetxController {
  final MainController _homeController = Get.find<MainController>();

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
    courses = _homeController.courses;
    courseSearch = _homeController.courses;
    categorys = _homeController.categorys;
    super.onInit();
  }

  @override
  void onClose() {
    _debounce?.cancel();
    super.onClose();
  }

  Future<void> onPressCourse(Course obj) async {
    if (obj.id != "") {
      Get.toNamed(ManagerRoutes.courseDetailScreen);
    }
  }

  void onChangedCategory(String id, int index) {
    currentCategory.value = index;
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
