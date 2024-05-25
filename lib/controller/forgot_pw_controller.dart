import 'package:e_course_flutter/api/base_api.dart';
import 'package:e_course_flutter/managers/manager_address.dart';
import 'package:e_course_flutter/managers/manager_path_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ForgotPwController extends GetxController {
  PageController indicator = PageController();
  TextEditingController otpTextEditController = TextEditingController();
  TextEditingController emailTextEditController = TextEditingController();
  TextEditingController passwordTextEditController = TextEditingController();
  TextEditingController newPasswordTextEditController = TextEditingController();

  final BaseAPI _baseAPI = BaseAPI();

  final RxBool _isShowLoading = false.obs;

  bool get isShowLoading => _isShowLoading.value;

  set isShowLoading(bool isShowLoading) {
    _isShowLoading.value = isShowLoading;
  }

  bool _isEmailValid(String email) {
    final RegExp emailRegExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    );
    return emailRegExp.hasMatch(email);
  }

  void onPressSendOTP() {
    if (emailTextEditController.text != "") {
      if (_isEmailValid(emailTextEditController.text)) {
        _baseAPI
            .fetchData(
                ManagerAddress.accountForgotPassword +
                    emailTextEditController.text,
                method: ApiMethod.POST)
            .then((value) {
          switch (value.apiStatus) {
            case ApiStatus.SUCCEEDED:
              {
                Fluttertoast.showToast(
                    msg: "Password has been successfully changed.");
                Get.toNamed(ManagerRoutes.otpScreen);
              }
            default:
              {
                Fluttertoast.showToast(msg: "Error");
              }
          }
        });
      } else {
        Fluttertoast.showToast(msg: "Please enter a valid email.");
      }
    } else {
      Fluttertoast.showToast(msg: "Please enter email!");
    }
  }

  void onPressChangePassword() {
    if (passwordTextEditController.text.length > 8) {
      if (passwordTextEditController.text ==
          newPasswordTextEditController.text) {
        Map<String, dynamic> body = {
          "email": emailTextEditController.text,
          "newPasswordToken": otpTextEditController.text,
          "newPassword": passwordTextEditController.text,
        };
        _baseAPI
            .fetchData(ManagerAddress.accountResetPassword,
                method: ApiMethod.POST, body: body)
            .then((value) {
          switch (value.apiStatus) {
            case ApiStatus.SUCCEEDED:
              {
                Get.toNamed(ManagerRoutes.signInScreen);
              }
            default:
              {
                Fluttertoast.showToast(msg: "Error");
              }
          }
        });
      } else {
        Fluttertoast.showToast(
            msg: "New password and confirm password are not equal");
      }
    } else {
      Fluttertoast.showToast(msg: "The min length of password is 8");
    }
  }

  RxInt page = 0.obs;
}
