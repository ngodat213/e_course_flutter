import 'package:e_course_flutter/api/base_api.dart';
import 'package:e_course_flutter/controller/home_controller.dart';
import 'package:e_course_flutter/controller/main_controller.dart';
import 'package:e_course_flutter/managers/manager_address.dart';
import 'package:e_course_flutter/models/exam.dart';
import 'package:get/get.dart';

class FavoriteExamController extends GetxController {
  final MainController _mainController = Get.find<MainController>();
  final HomeController _homeController = Get.find<HomeController>();
  late RxList<Exam> myFavExam = RxList<Exam>();

  final BaseAPI _baseAPI = BaseAPI();

  final RxBool _isShowLoading = false.obs;

  bool get isShowLoading => _isShowLoading.value;

  set isShowLoading(bool isShowLoading) {
    _isShowLoading.value = isShowLoading;
  }

  @override
  void onInit() async {
    _isShowLoading.value = true;
    await handleMyFavExam();
    _isShowLoading.value = false;
    super.onInit();
  }

  void onPressExam(Exam obj) {
    _homeController.onPressExam(obj);
  }

  Future<void> handleMyFavExam() async {
    print(_mainController.currentAccount.value.favouritesExams!);
    _isShowLoading.value = true;
    for (var e in _mainController.currentAccount.value.favouritesExams!) {
      _baseAPI.fetchData(ManagerAddress.baseExam + e).then((value) async {
        switch (value.apiStatus) {
          case ApiStatus.SUCCEEDED:
            {
              myFavExam.add(Exam.fromJson(value.object));
            }
        }
      });
    }
    _isShowLoading.value = false;
  }
}
