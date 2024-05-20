import 'package:e_course_flutter/api/base_api.dart';
import 'package:e_course_flutter/controller/course_list_controller.dart';
import 'package:e_course_flutter/controller/main_controller.dart';
import 'package:e_course_flutter/managers/manager_address.dart';
import 'package:e_course_flutter/managers/manager_key_storage.dart';
import 'package:e_course_flutter/managers/manager_path_routes.dart';
import 'package:e_course_flutter/models/models.dart';
import 'package:e_course_flutter/utils/base_shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // ----------- Variable -----------
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

  final BaseAPI _baseApi = BaseAPI();

  final RxBool _isShowLoading = false.obs;

  bool get isShowLoading => _isShowLoading.value;

  set isShowLoading(bool isShowLoading) {
    _isShowLoading.value = isShowLoading;
  }

  @override
  void onInit() async {
    _isShowLoading.value = true;
    await getCurrentUser();
    handleData();
    _isShowLoading.value = false;
    super.onInit();
  }

  void handleData() {
    courses = _mainController.courses;
    exams = _mainController.exams;
    categorys = _mainController.categorys;
  }

  Future<void> getCurrentUser() async {
    _isShowLoading.value = true;
    if (await BaseSharedPreferences.getStringValue(
            ManagerKeyStorage.accessToken) !=
        "") {
      final String token = await BaseSharedPreferences.getStringValue(
          ManagerKeyStorage.accessToken);

      await _baseApi
          .fetchData(
        ManagerAddress.accountCurrent,
        headers: {"Authorization": "Bearer $token"},
        method: ApiMethod.GET,
      )
          .then((value) async {
        switch (value.apiStatus) {
          case ApiStatus.SUCCEEDED:
            {
              currentAccount.value = User.fromJson(value.object);
            }
          default:
            {
              printLogError('FAILED');
              Fluttertoast.showToast(msg: "Login Fail");
            }
        }
      });
      _isShowLoading.value = false;
    }
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
