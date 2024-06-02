import 'package:e_course_flutter/controller/change_language_controller.dart';
import 'package:e_course_flutter/controller/setting_controller.dart';
import 'package:get/get.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingController());
    Get.lazyPut(() => ChangeLanguageController());
  }
}
