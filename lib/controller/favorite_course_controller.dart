import 'package:e_course_flutter/api/base_api.dart';
import 'package:e_course_flutter/controller/home_screen_controller.dart';
import 'package:e_course_flutter/controller/main_controller.dart';
import 'package:e_course_flutter/managers/manager_address.dart';
import 'package:e_course_flutter/models/course.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class FavoriteCourseController extends GetxController {
  final MainController _mainController = Get.find<MainController>();
  final HomeController _homeController = Get.find<HomeController>();
  late RxList<Course> myFavCourse = RxList<Course>();

  final BaseAPI _baseAPI = BaseAPI();

  final RxBool _isShowLoading = false.obs;

  bool get isShowLoading => _isShowLoading.value;

  set isShowLoading(bool isShowLoading) {
    _isShowLoading.value = isShowLoading;
  }

  @override
  void onInit() async {
    _isShowLoading.value = true;
    await handleMyFavCourse();
    _isShowLoading.value = false;
    super.onInit();
  }

  void onPressCourse(Course obj) {
    _homeController.onPressCourse(obj);
  }

  Future<void> handleMyFavCourse() async {
    _isShowLoading.value = true;
    for (var e in _mainController.currentAccount.value.favouritesCourses!) {
      _baseAPI.fetchData(ManagerAddress.baseCourse + e).then((value) async {
        switch (value.apiStatus) {
          case ApiStatus.SUCCEEDED:
            {
              myFavCourse.add(Course.fromJson(value.object));
            }
          default:
            {
              Fluttertoast.showToast(msg: "Error");
            }
        }
      });
    }
    _isShowLoading.value = false;
  }
}
