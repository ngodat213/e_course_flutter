import 'package:e_course_flutter/controller/signin_controller.dart';
import 'package:e_course_flutter/models/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final SignInController _signInController = Get.find<SignInController>();

  User currentAccount = const User();

  final RxBool _isShowLoading = false.obs;

  bool get isShowLoading => _isShowLoading.value;

  set isShowLoading(bool isShowLoading) {
    _isShowLoading.value = isShowLoading;
  }

  late TabController _tabController;
  @override
  void onInit() async {
    setCurrentAccount();
    super.onInit();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void setCurrentAccount() {
    currentAccount = _signInController.currentAccount.value;
    print(currentAccount.email);
  }
}
