import 'package:e_course_flutter/api/base_api.dart';
import 'package:e_course_flutter/controller/change_language_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MainAppController extends GetxController {
  final ChangeLanguageController _changeLanguageController =
      Get.find<ChangeLanguageController>();
  late Rx<Locale> stateAppLang;

  @override
  void onInit() async {
    await _changeLanguageController.getLang();
    stateAppLang = _changeLanguageController.locale.value.obs;
    BaseAPI.domain = dotenv.env["DOMAIN"]!;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    super.onInit();
  }
}
