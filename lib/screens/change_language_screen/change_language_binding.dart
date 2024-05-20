import 'package:e_course_flutter/controller/change_language_controller.dart';
import 'package:get/get.dart';

class ChangeLanguageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ChangeLanguageController());
  }
}
