import 'package:e_course_flutter/controller/signin_controller.dart';
import 'package:e_course_flutter/controller/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignInController());
    Get.put(SplashController());
  }
}
