import 'package:e_course_flutter/api/base_api.dart';
import 'package:e_course_flutter/controller/home_screen_controller.dart';
import 'package:e_course_flutter/managers/manager_address.dart';
import 'package:e_course_flutter/managers/manager_key_storage.dart';
import 'package:e_course_flutter/managers/manager_path_routes.dart';
import 'package:e_course_flutter/models/models.dart';
import 'package:e_course_flutter/utils/base_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final HomeController _homeController = Get.find<HomeController>();
  // Update username
  TextEditingController usernameController = TextEditingController();
  // Update email
  TextEditingController emailController = TextEditingController();
  // Update password
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newpasswordController = TextEditingController();
  TextEditingController confimpasswordController = TextEditingController();

  Rx<User> currentAccount = const User().obs;

  final BaseAPI _baseAPI = BaseAPI();

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
    currentAccount.value = _homeController.currentAccount.value;
  }

  void onPressChangedPassword() async {
    if (newpasswordController.text == confimpasswordController.text &&
        newpasswordController != "") {
      final String token = await BaseSharedPreferences.getStringValue(
          ManagerKeyStorage.accessToken);
      Map<String, dynamic> body = {
        "password": oldPasswordController.text,
        "newPassword": newpasswordController.text,
      };

      final headers = {"Authorization": "Bearer $token"};
      _baseAPI
          .fetchData(ManagerAddress.baseAccount + currentAccount.value.id!,
              headers: headers, body: body, method: ApiMethod.PUT)
          .then((value) async {
        switch (value.apiStatus) {
          case ApiStatus.SUCCEEDED:
            {
              Fluttertoast.showToast(msg: "Password has been changed");

              setCurrentAccount();
              Get.back();
              break;
            }
          default:
            {
              Fluttertoast.showToast(msg: "Update password fail");
            }
        }
      });
    }
  }

  void onPressChangedEmail() async {
    if (emailController.text != "") {
      final String token = await BaseSharedPreferences.getStringValue(
          ManagerKeyStorage.accessToken);
      Map<String, dynamic> body = {
        "email": emailController.text,
      };

      final headers = {"Authorization": "Bearer $token"};
      _baseAPI
          .fetchData(ManagerAddress.baseAccount + currentAccount.value.id!,
              headers: headers, body: body, method: ApiMethod.PUT)
          .then((value) async {
        switch (value.apiStatus) {
          case ApiStatus.SUCCEEDED:
            {
              Fluttertoast.showToast(msg: "Email has been changed");
              _homeController.currentAccount.value = _homeController
                  .currentAccount.value
                  .copyWith(email: emailController.text);
              setCurrentAccount();
              Get.offAllNamed(ManagerRoutes.signInScreen);
              break;
            }
          default:
            {
              Fluttertoast.showToast(msg: "Email already exist");
            }
        }
      });
    }
  }

  void onPressChangedUsername() async {
    if (usernameController.text != "") {
      final String token = await BaseSharedPreferences.getStringValue(
          ManagerKeyStorage.accessToken);
      Map<String, dynamic> body = {
        "username": usernameController.text,
      };

      final headers = {"Authorization": "Bearer $token"};
      _baseAPI
          .fetchData(ManagerAddress.baseAccount + currentAccount.value.id!,
              headers: headers, body: body, method: ApiMethod.PUT)
          .then((value) async {
        switch (value.apiStatus) {
          case ApiStatus.SUCCEEDED:
            {
              Fluttertoast.showToast(msg: "Username has been changed");
              _homeController.currentAccount.value = _homeController
                  .currentAccount.value
                  .copyWith(username: usernameController.text);
              setCurrentAccount();
              Get.back();
              break;
            }
          default:
            {
              Fluttertoast.showToast(msg: "Update password fail");
            }
        }
      });
    }
  }
}
