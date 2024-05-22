import 'package:e_course_flutter/api/base_api.dart';
import 'package:e_course_flutter/controller/home_screen_controller.dart';
import 'package:e_course_flutter/controller/main_controller.dart';
import 'package:e_course_flutter/managers/manager_address.dart';
import 'package:e_course_flutter/managers/manager_key_storage.dart';
import 'package:e_course_flutter/managers/manager_path_routes.dart';
import 'package:e_course_flutter/models/models.dart';
import 'package:e_course_flutter/utils/base_shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExamDetailController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final HomeController _homeController = Get.find<HomeController>();
  final MainController _mainController = Get.find<MainController>();

  late RxBool isFav;
  late TabController tabController;

  Rx<Exam> exam = const Exam().obs;
  RxList<ExamLesson> examLessons = <ExamLesson>[].obs;
  RxList<ExamQuestion> currentQuestions = RxList<ExamQuestion>();
  Rx<ExamLesson> currentLesson = ExamLesson().obs;

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
    handleCurrentExam();
    handleFav();
    handleExamLesson();
    _isShowLoading.value = false;
    super.onInit();
  }

  void handleFav() {
    final User user = _mainController.currentAccount.value;
    if (user.favouritesExams!.contains(exam.value.id)) {
      isFav = true.obs;
    } else {
      isFav = false.obs;
    }
  }

  void handleCurrentExam() {
    exam.value = _homeController.currentExam.value;
  }

  Future<void> handleExamLesson() async {
    _isShowLoading.value = true;
    await _baseAPI
        .fetchData(ManagerAddress.baseQuizLessonOf + exam.value.id!,
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

  void onPressFav() async {
    final String token = await BaseSharedPreferences.getStringValue(
        ManagerKeyStorage.accessToken);
    final User user = _mainController.currentAccount.value;
    List<String> favs = user.favouritesExams!;

    if (isFav.value == true) {
      favs.remove(exam.value.id!);
    } else {
      favs.add(exam.value.id!);
    }

    Map<String, dynamic> body = {
      "favouritesExams": favs,
    };

    final headers = {"Authorization": "Bearer $token"};
    _baseAPI
        .fetchData(ManagerAddress.baseAccount + user.id!,
            headers: headers, body: body, method: ApiMethod.PUT)
        .then((value) async {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            _mainController.getCurrentUser();
            handleFav();
            break;
          }
        default:
          {
            Fluttertoast.showToast(msg: "Email already exist");
          }
      }
    });
  }

  void onPressLesson(ExamLesson obj) {
    currentLesson.value = obj;
    Get.offNamed(ManagerRoutes.examPlayScreen);
  }
}
