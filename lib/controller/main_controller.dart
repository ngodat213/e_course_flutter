import 'package:e_course_flutter/api/base_api.dart';
import 'package:e_course_flutter/managers/manager_address.dart';
import 'package:e_course_flutter/managers/manager_key_storage.dart';
import 'package:e_course_flutter/models/models.dart';
import 'package:e_course_flutter/utils/base_shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  var page = 0.obs;

  RxList<Course> courses = RxList<Course>();
  RxList<Exam> exams = RxList<Exam>();
  RxList<Category> categorys = RxList<Category>();

  Rx<User> currentAccount = const User().obs;

  final BaseAPI _baseApi = BaseAPI();

  final RxBool _isShowLoading = false.obs;

  bool get isShowLoading => _isShowLoading.value;

  set isShowLoading(bool isShowLoading) {
    _isShowLoading.value = isShowLoading;
  }

  @override
  Future<void> onInit() async {
    await handleCourse();
    await handleCategory();
    await handleQuiz();
    await getCurrentUser();
    super.onInit();
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

  Future<void> handleCourse() async {
    _isShowLoading.value = true;
    await _baseApi
        .fetchData(ManagerAddress.baseCourse, method: ApiMethod.GET)
        .then(
      (value) async {
        switch (value.apiStatus) {
          case ApiStatus.SUCCEEDED:
            {
              courses.value = List<Course>.from(
                  value.object.map((x) => Course.fromJson(x)));
              courses.removeWhere((course) => course.deleteAt != null);
            }
        }
      },
    );
    _isShowLoading.value = false;
  }

  Future<void> handleCategory() async {
    _isShowLoading.value = true;
    await _baseApi
        .fetchData(ManagerAddress.baseCategory, method: ApiMethod.GET)
        .then(
      (value) async {
        switch (value.apiStatus) {
          case ApiStatus.SUCCEEDED:
            {
              categorys.value = List<Category>.from(
                  value.object.map((x) => Category.fromJson(x)));
              categorys.removeWhere((category) => category.deleteAt != null);
            }
        }
      },
    );
    _isShowLoading.value = false;
  }

  Future<void> handleQuiz() async {
    _isShowLoading.value = true;
    await _baseApi
        .fetchData(ManagerAddress.baseExam, method: ApiMethod.GET)
        .then(
      (value) async {
        switch (value.apiStatus) {
          case ApiStatus.SUCCEEDED:
            {
              exams.value =
                  List<Exam>.from(value.object.map((x) => Exam.fromJson(x)));
              exams.removeWhere((exam) => exam.deleteAt != null);
            }
        }
      },
    );
    _isShowLoading.value = false;
  }
}
