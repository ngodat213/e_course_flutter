import 'package:e_course_flutter/controller/forgot_pw_controller.dart';
import 'package:get/get.dart';

class ForgotPwBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ForgotPwController());
  }
}
