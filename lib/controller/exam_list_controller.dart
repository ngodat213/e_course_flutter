import 'dart:async';

import 'package:e_course_flutter/api/base_api.dart';
import 'package:e_course_flutter/controller/home_controller.dart';
import 'package:e_course_flutter/controller/main_controller.dart';
import 'package:e_course_flutter/managers/manager_address.dart';
import 'package:e_course_flutter/managers/manager_path_routes.dart';
import 'package:e_course_flutter/models/category.dart';
import 'package:e_course_flutter/models/exam.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ExamListController extends GetxController {
  final MainController _mainController = Get.find<MainController>();
  final HomeController _homeController = Get.find<HomeController>();

  late List<Exam> exams;
  late List<Category> categorys;
  late RxList<Exam> examSearch;

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
    exams = _mainController.exams;
    examSearch = _mainController.exams;
    categorys = _mainController.categorys;
    super.onInit();
  }

  @override
  void onClose() {
    _debounce?.cancel();
    super.onClose();
  }

  Future<void> onPressExam(Exam obj) async {
    if (obj.id != "") {
      _homeController.currentExam.value = obj;
      Get.toNamed(ManagerRoutes.examDetailScreen);
    }
  }

  void onChangedCategory(String id, int index) {
    currentCategory.value = index;
    _baseAPI.fetchData(ManagerAddress.baseExam, params: {"category": id}).then(
        (value) async {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            examSearch.value =
                List<Exam>.from(value.object.map((x) => Exam.fromJson(x)));
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
      _baseAPI.fetchData(ManagerAddress.baseExam, params: {"q": value}).then(
          (value) async {
        switch (value.apiStatus) {
          case ApiStatus.SUCCEEDED:
            {
              examSearch.value =
                  List<Exam>.from(value.object.map((x) => Exam.fromJson(x)));
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
