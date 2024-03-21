import 'package:e_course_flutter/controller/signin_controller.dart';
import 'package:e_course_flutter/models/models.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  late User currentUser;
  final SignInController _signInController = Get.find<SignInController>();

  @override
  void onInit() {
    currentUser = _signInController.currentAccount.value;
    super.onInit();
  }
}
