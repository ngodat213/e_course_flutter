import 'package:e_course_flutter/api/base_api.dart';
import 'package:e_course_flutter/controller/home_screen_controller.dart';
import 'package:e_course_flutter/managers/manager_address.dart';
import 'package:e_course_flutter/managers/manager_path_routes.dart';
import 'package:e_course_flutter/models/models.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExamDetailController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late Exam exam;

  RxList<ExamLesson> examLessons = <ExamLesson>[].obs;
  RxList<ExamQuestion> currentQuestions = RxList<ExamQuestion>();

  Rx<ExamLesson> currentLesson = ExamLesson().obs;

  late TabController tabController;
  final HomeController _homeController = Get.find<HomeController>();

  final BaseAPI _baseAPI = BaseAPI();

  final RxBool _isShowLoading = false.obs;

  bool get isShowLoading => _isShowLoading.value;

  set isShowLoading(bool isShowLoading) {
    _isShowLoading.value = isShowLoading;
  }

  @override
  void onInit() async {
    _isShowLoading.value = true;
    tabController = TabController(length: 2, vsync: this);
    exam = _homeController.currentExam.value;
    handleExamLesson();
    _isShowLoading.value = false;
    super.onInit();
  }

  Future<void> handleExamLesson() async {
    _isShowLoading.value = true;
    await _baseAPI
        .fetchData(ManagerAddress.baseQuizLessonOf + exam.id!,
            method: ApiMethod.GET)
        .then((value) async {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            examLessons.value = List<ExamLesson>.from(
                value.object.map((x) => ExamLesson.fromDoc(x)));
            for (ExamLesson lesson in examLessons) {
              await _baseAPI
                  .fetchData(ManagerAddress.baseExamOfQuestion + lesson.id!,
                      method: ApiMethod.GET)
                  .then((value) {
                switch (value.apiStatus) {
                  case ApiStatus.SUCCEEDED:
                    {
                      lesson.questions = List<ExamQuestion>.from(
                          value.object.map((x) => ExamQuestion.fromDoc(x)));
                    }
                  default:
                    {
                      printLogError('FAILED');
                      Fluttertoast.showToast(msg: "Get data fail");
                    }
                }
                return null;
              });
            }
          }
        default:
          {
            printLogError('FAILED');
            Fluttertoast.showToast(msg: "Get data fail");
          }
      }
    });
    _isShowLoading.value = false;
  }

  void onPressLesson(ExamLesson obj) {
    currentLesson.value = obj;
    Get.offNamed(ManagerRoutes.examPlayScreen);
  }
}
