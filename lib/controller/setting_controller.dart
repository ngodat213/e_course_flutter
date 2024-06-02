import 'package:e_course_flutter/controller/main_controller.dart';
import 'package:e_course_flutter/models/models.dart';
import 'package:e_course_flutter/utils/localization_managet.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  final MainController _mainController = Get.find<MainController>();
  final _localizationManager = LocalizationManager();
  RxString language = "".obs;

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
    await getLang();
    _isShowLoading.value = false;
    super.onInit();
  }

  Future<void> getLang() async {
    final lang = await _localizationManager.getLocalization();
    switch (lang) {
      case 0:
        language.value = "English";
        break;
      case 1:
        language.value = "Vietnamese";
        break;
    }
  }

  void getCurrentUser() {
    currentAccount.value = _mainController.currentAccount.value;
  }
}
