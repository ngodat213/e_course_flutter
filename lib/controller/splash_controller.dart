import 'package:e_course_flutter/controller/signin_controller.dart';
import 'package:e_course_flutter/managers/manager_key_storage.dart';
import 'package:e_course_flutter/managers/manager_path_routes.dart';
import 'package:e_course_flutter/utils/base_shared_preferences.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  var screenDelay = 3;

  late SignInController _signInController;

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () async {
      Get.offAllNamed(ManagerRoutes.onboarding);
      if (await BaseSharedPreferences.getStringValue(
              ManagerKeyStorage.accessToken) !=
          "") {
        Get.offAllNamed(ManagerRoutes.homeScreen);
      }
    });
    super.onInit();
  }
}
