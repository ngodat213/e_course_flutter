import 'package:e_course_flutter/api/base_api.dart';
import 'package:e_course_flutter/controller/signin_controller.dart';
import 'package:e_course_flutter/managers/manager_address.dart';
import 'package:e_course_flutter/models/models.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // ----------- Variable -----------
  RxInt dotIndicator = 0.obs;
  RxList<Course> courses = RxList<Course>();

  final BaseAPI _baseAPI = BaseAPI();

  User currentAccount = const User();

  final RxBool _isShowLoading = false.obs;

  final SignInController _signInController = Get.find<SignInController>();

  bool get isShowLoading => _isShowLoading.value;

  set isShowLoading(bool isShowLoading) {
    _isShowLoading.value = isShowLoading;
  }

  @override
  void onInit() async {
    currentAccount = _signInController.currentAccount.value;
    await fetchCourse();
    super.onInit();
  }

  Future<void> fetchCourse() async {
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
}
