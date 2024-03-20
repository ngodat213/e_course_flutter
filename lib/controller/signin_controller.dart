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

  User currentAccount = const User();

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
              currentAccount = User.fromJson(value.object);
              await BaseSharedPreferences.saveStringValue(
                  ManagerKeyStorage.accessToken, currentAccount.token ?? '');
              Get.offAllNamed(ManagerRoutes.homeScreen);
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
}
