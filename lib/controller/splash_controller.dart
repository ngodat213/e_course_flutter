import 'package:e_course_flutter/controller/signin_controller.dart';
import 'package:e_course_flutter/managers/manager_key_storage.dart';
import 'package:e_course_flutter/managers/manager_path_routes.dart';
import 'package:e_course_flutter/utils/base_shared_preferences.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  var screenDelay = 3;
  final SignInController _signInController = Get.find<SignInController>();

  @override
  void onInit() async {
    await _signInController.decodeToken();
    await delayScreen();
    super.onInit();
  }

  Future<void> delayScreen() async {
    Future.delayed(Duration(seconds: screenDelay), () async {
      if (await BaseSharedPreferences.getStringValue(
              ManagerKeyStorage.accessToken) !=
          "") {
        Get.offNamed(ManagerRoutes.mainScreen);
      } else {
        Get.offNamed(ManagerRoutes.onboarding);
      }
    });
  }
}
