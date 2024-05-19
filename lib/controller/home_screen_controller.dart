import 'package:e_course_flutter/controller/course_list_controller.dart';
import 'package:e_course_flutter/controller/main_controller.dart';
import 'package:e_course_flutter/controller/signin_controller.dart';
import 'package:e_course_flutter/managers/manager_path_routes.dart';
import 'package:e_course_flutter/models/models.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // ----------- Variable -----------
  final SignInController _signInController = Get.find<SignInController>();
  final MainController _mainController = Get.find<MainController>();
  final CourseListController _courseListController =
      Get.find<CourseListController>();

  RxInt dotIndicator = 0.obs;
  Rx<Course> currentCourse = Course().obs;
  Rx<Exam> currentExam = const Exam().obs;

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
    setCurrentAccount();
    handleData();
    super.onInit();
  }

  void handleData() {
    courses = _mainController.courses;
    exams = _mainController.exams;
    categorys = _mainController.categorys;
  }

  void setCurrentAccount() {
    currentAccount.value = _signInController.currentAccount.value;
  }

  void onPressCourse(Course obj) {
    if (obj.id != "") {
      currentCourse.value = obj;
      Get.toNamed(ManagerRoutes.courseDetailScreen);
    }
  }

  void onPressExam(Exam obj) {
    if (obj.id != "") {
      currentExam.value = obj;
      Get.toNamed(ManagerRoutes.examDetailScreen);
    }
  }

  void onPressCategory(String id, int index) {
    _courseListController.onChangedCategory(id, index);
    Get.toNamed(ManagerRoutes.courseListScreen);
  }
}
