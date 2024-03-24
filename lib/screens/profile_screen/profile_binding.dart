import 'package:e_course_flutter/controller/profile_controller.dart';
import 'package:e_course_flutter/controller/signin_controller.dart';
import 'package:get/get.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignInController());
    Get.put(ProfileController());
  }
}
