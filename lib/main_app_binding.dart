import 'package:e_course_flutter/controller/change_language_controller.dart';
import 'package:e_course_flutter/controller/main_app_contronller.dart';
import 'package:get/get.dart';

class MainAppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MainAppController());
    Get.put(ChangeLanguageController());
  }
}
