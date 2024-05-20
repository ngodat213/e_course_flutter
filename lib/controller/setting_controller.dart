import 'package:e_course_flutter/controller/main_controller.dart';
import 'package:e_course_flutter/models/models.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  final MainController _mainController = Get.find<MainController>();
  Rx<User> currentAccount = const User().obs;

  final RxBool _isShowLoading = false.obs;

  bool get isShowLoading => _isShowLoading.value;

  set isShowLoading(bool isShowLoading) {
    _isShowLoading.value = isShowLoading;
  }

  @override
  void onInit() async {
    _isShowLoading.value = true;
    getCurrentUser();
    _isShowLoading.value = false;
    super.onInit();
  }

  void getCurrentUser() {
    currentAccount.value = _mainController.currentAccount.value;
  }
}
