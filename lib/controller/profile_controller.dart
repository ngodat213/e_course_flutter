import 'package:e_course_flutter/managers/manager_key_storage.dart';
import 'package:e_course_flutter/models/models.dart';
import 'package:e_course_flutter/utils/base_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class ProfileController extends GetxController {
  User currentAccount = const User();

  final RxBool _isShowLoading = false.obs;

  bool get isShowLoading => _isShowLoading.value;

  set isShowLoading(bool isShowLoading) {
    _isShowLoading.value = isShowLoading;
  }

  late TabController _tabController;
  @override
  void onInit() async {
    await decodeToken();
    super.onInit();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> decodeToken() async {
    _isShowLoading.value = true;
    if (await BaseSharedPreferences.getStringValue(
            ManagerKeyStorage.accessToken) !=
        "") {
      Map<String, dynamic> decodedJwt = JwtDecoder.decode(
          await BaseSharedPreferences.getStringValue(
              ManagerKeyStorage.accessToken));
      currentAccount = User.fromJson(decodedJwt);
    }
    _isShowLoading.value = false;
  }
}
