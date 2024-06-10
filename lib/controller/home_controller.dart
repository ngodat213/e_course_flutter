import 'package:e_course_flutter/controller/main_controller.dart';
import 'package:e_course_flutter/managers/manager_path_routes.dart';
import 'package:e_course_flutter/models/models.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final MainController _mainController = Get.find<MainController>();

  RxInt dotIndicator = 0.obs;
  Rx<Course> currentCourse = Course().obs;
  Rx<Exam> currentExam = Exam().obs;

  // Course list
  RxInt currentCategoryCourse = 0.obs;
  RxString currentCategoryCourseId = "".obs;

  late List<Course> courses;
  late List<Category> categorys;
  late List<Exam> exams;

  Rx<User> currentAccount = const User().obs;

  final RxBool _isShowLoading = false.obs;

  bool get isShowLoading => _isShowLoading.value;

  set isShowLoading(bool isShowLoading) {
    _isShowLoading.value = isShowLoading;
  }

  @override
  void onInit() {
    super.onInit();
    _isShowLoading.value = true;
    getCurrentUser();
    handleData();
    _isShowLoading.value = false;
  }

  void handleData() {
    courses = _mainController.courses;
    exams = _mainController.exams;
    categorys = _mainController.categorys;
  }

  void getCurrentUser() {
    currentAccount.value = _mainController.currentAccount.value;
  }

  void onPressCourse(Course obj) {
    if (obj.id!.isNotEmpty) {
      currentCourse.value = obj;
      Get.toNamed(ManagerRoutes.courseDetailScreen);
    }
  }

  void onPressExam(Exam obj) {
    if (obj.id!.isNotEmpty) {
      currentExam.value = obj;
      Get.toNamed(ManagerRoutes.examDetailScreen);
    }
  }

  void onPressCategory(String id, int index) {
    currentCategoryCourse.value = index;
    currentCategoryCourseId.value = id;
    Get.toNamed(ManagerRoutes.courseListScreen);
  }
}
