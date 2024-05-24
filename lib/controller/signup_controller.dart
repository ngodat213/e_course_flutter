import 'package:e_course_flutter/api/base_api.dart';
import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/managers/manager_address.dart';
import 'package:e_course_flutter/managers/manager_path_routes.dart';
import 'package:e_course_flutter/models/models.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController confirmPwController = TextEditingController();

  final BaseAPI _baseApi = BaseAPI();

  User currentAccount = const User();

  final RxBool _isShowLoading = false.obs;

  bool get isShowLoading => _isShowLoading.value;

  set isShowLoading(bool isShowLoading) {
    _isShowLoading.value = isShowLoading;
  }

  Future<void> onPressSignUp(BuildContext context) async {
    if (usernameController.text != "" &&
        emailController.text != "" &&
        pwController.text != "" &&
        confirmPwController.text != "" &&
        confirmPwController.text == pwController.text) {
      _isShowLoading.value = true;
      await _baseApi
          .fetchData(
        ManagerAddress.accountSignup,
        body: {
          'username': usernameController.text,
          'email': emailController.text,
          'password': pwController.text
        },
        method: ApiMethod.POST,
      )
          .then((value) async {
        switch (value.apiStatus) {
          case ApiStatus.SUCCEEDED:
            {
              Fluttertoast.showToast(msg: S.of(context).signupSucessfully);
              Get.offAllNamed(ManagerRoutes.signInScreen);
            }
          default:
            {
              printLogError('FAILED');
              Fluttertoast.showToast(msg: S.of(context).loginFail);
            }
        }
      });
    } else {
      Fluttertoast.showToast(msg: S.of(context).loginFail);
    }
    _isShowLoading.value = false;
  }
}
