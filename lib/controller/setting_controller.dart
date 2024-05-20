import 'package:e_course_flutter/api/base_api.dart';
import 'package:e_course_flutter/controller/main_controller.dart';
import 'package:e_course_flutter/managers/manager_address.dart';
import 'package:e_course_flutter/managers/manager_key_storage.dart';
import 'package:e_course_flutter/models/models.dart';
import 'package:e_course_flutter/utils/base_shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  final MainController _mainController = Get.find<MainController>();

  Rx<User> currentAccount = const User().obs;

  final BaseAPI _baseApi = BaseAPI();

  final RxBool _isShowLoading = false.obs;

  bool get isShowLoading => _isShowLoading.value;

  set isShowLoading(bool isShowLoading) {
    _isShowLoading.value = isShowLoading;
  }

  @override
  void onInit() async {
    _isShowLoading.value = true;
    await getCurrentAccount();
    _isShowLoading.value = false;
    super.onInit();
  }

  Future<void> getCurrentAccount() async {
    _isShowLoading.value = true;
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
      _isShowLoading.value = false;
    }
  }
}
