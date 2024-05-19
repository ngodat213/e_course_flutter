import 'package:e_course_flutter/api/base_api.dart';
import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/managers/manager_address.dart';
import 'package:e_course_flutter/managers/manager_key_storage.dart';
import 'package:e_course_flutter/managers/manager_path_routes.dart';
import 'package:e_course_flutter/models/models.dart';
import 'package:e_course_flutter/utils/base_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final BaseAPI _baseApi = BaseAPI();

  Rx<User> currentAccount = const User().obs;

  final RxBool _isShowLoading = false.obs;

  bool get isShowLoading => _isShowLoading.value;

  set isShowLoading(bool isShowLoading) {
    _isShowLoading.value = isShowLoading;
  }

  Future<void> onPressLogin(BuildContext context) async {
    if (emailController.text != "" && passwordController.text != "") {
      _isShowLoading.value = true;
      await _baseApi
          .fetchData(
        ManagerAddress.accountLogin,
        body: {
          'email': emailController.text,
          'password': passwordController.text
        },
        method: ApiMethod.POST,
      )
          .then((value) async {
        switch (value.apiStatus) {
          case ApiStatus.SUCCEEDED:
            {
              await BaseSharedPreferences.saveStringValue(
                  ManagerKeyStorage.accessToken,
                  value.object["access_token"] ?? '');
              getCurrentUser();
              Fluttertoast.showToast(msg: S.of(context).loginSuccessfully);
              Get.offAndToNamed(ManagerRoutes.mainScreen);
            }
          default:
            {
              printLogError('FAILED');
              Fluttertoast.showToast(msg: "Login Fail");
            }
        }
      });
    } else {
      Fluttertoast.showToast(msg: S.of(context).loginFail);
    }
    _isShowLoading.value = false;
  }

  Future<void> getCurrentUser() async {
    if (await BaseSharedPreferences.getStringValue(
            ManagerKeyStorage.accessToken) !=
        "") {
      final String token = await BaseSharedPreferences.getStringValue(
          ManagerKeyStorage.accessToken);

      await _baseApi
          .fetchData(
        ManagerAddress.accountCurrent,
        headers: {"Authorization": "Bearer $token"},
        method: ApiMethod.GET,
      )
          .then((value) async {
        switch (value.apiStatus) {
          case ApiStatus.SUCCEEDED:
            {
              currentAccount.value = User.fromJson(value.object);
            }
          default:
            {
              printLogError('FAILED');
              Fluttertoast.showToast(msg: "Login Fail");
            }
        }
      });
    }
  }
}
