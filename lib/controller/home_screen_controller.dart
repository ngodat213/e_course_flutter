import 'package:e_course_flutter/api/base_api.dart';
import 'package:e_course_flutter/controller/signin_controller.dart';
import 'package:e_course_flutter/managers/manager_address.dart';
import 'package:e_course_flutter/managers/manager_path_routes.dart';
import 'package:e_course_flutter/models/category.dart';
import 'package:e_course_flutter/models/models.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // ----------- Variable -----------
  final SignInController _signInController = Get.find<SignInController>();

  RxInt dotIndicator = 0.obs;
  RxList<Course> courses = RxList<Course>();
  RxList<Category> categorys = RxList<Category>();
  Rx<Course> currentCourse = Course().obs;

  User currentAccount = const User();

  final BaseAPI _baseAPI = BaseAPI();

  final RxBool _isShowLoading = false.obs;

  bool get isShowLoading => _isShowLoading.value;

  set isShowLoading(bool isShowLoading) {
    _isShowLoading.value = isShowLoading;
  }

  @override
  void onInit() async {
    currentAccount = _signInController.currentAccount.value;
    await handleCourse();
    await handleCategory();
    super.onInit();
  }

  Future<void> handleCourse() async {
    _isShowLoading.value = true;
    await _baseAPI
        .fetchData(ManagerAddress.baseCourse, method: ApiMethod.GET)
        .then(
      (value) async {
        switch (value.apiStatus) {
          case ApiStatus.SUCCEEDED:
            {
              courses.value = List<Course>.from(
                  value.object.map((x) => Course.fromJson(x)));
              print(courses.value.toString());
            }
        }
      },
    );
    _isShowLoading.value = false;
  }

  Future<void> handleCategory() async {
    _isShowLoading.value = true;
    await _baseAPI
        .fetchData(ManagerAddress.baseCategory, method: ApiMethod.GET)
        .then(
      (value) async {
        switch (value.apiStatus) {
          case ApiStatus.SUCCEEDED:
            {
              categorys.value = List<Category>.from(
                  value.object.map((x) => Category.fromDoc(x)));
              print(courses.value.toString());
            }
        }
      },
    );
    _isShowLoading.value = false;
  }

  Future<void> fetchQuiz() async {}

  void onPressCourse(Course obj) {
    if (obj.id != "") {
      currentCourse.value = obj;
      Get.toNamed(ManagerRoutes.courseDetailScreen);
    }
  }
}
