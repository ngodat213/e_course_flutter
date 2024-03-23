import 'package:e_course_flutter/api/base_api.dart';
import 'package:e_course_flutter/controller/signin_controller.dart';
import 'package:e_course_flutter/managers/manager_address.dart';
import 'package:e_course_flutter/managers/manager_path_routes.dart';
import 'package:e_course_flutter/models/models.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // ----------- Variable -----------
  final SignInController _signInController = Get.find<SignInController>();

  RxInt dotIndicator = 0.obs;
  RxList<Course> courses = RxList<Course>();

  Rx<Course> currentCourse = const Course().obs;

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
                  value.object['courses'].map((x) => Course.fromDoc(x)));
            }
        }
      },
    );
    _isShowLoading.value = false;
  }

  Future<void> fetchQuiz() async {}

  Future<void> fetchBlog() async {}

  Future<void> onPressCourse(Course obj) async {
    if (obj.uid != "") {
      currentCourse.value = obj;
      Get.toNamed(ManagerRoutes.courseDetailScreen);
    }
  }
}
