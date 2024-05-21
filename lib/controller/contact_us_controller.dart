import 'package:e_course_flutter/api/base_api.dart';
import 'package:e_course_flutter/managers/manager_address.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ContactUsController extends GetxController {
  final TextEditingController fullName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController topic = TextEditingController();
  final TextEditingController text = TextEditingController();

  final BaseAPI _baseAPI = BaseAPI();

  final RxBool _isShowLoading = false.obs;

  bool get isShowLoading => _isShowLoading.value;

  set isShowLoading(bool isShowLoading) {
    _isShowLoading.value = isShowLoading;
  }

  @override
  void onClose() {
    fullName.dispose();
    email.dispose();
    topic.dispose();
    text.dispose();
    super.onClose();
  }

  void onChangedSend() {
    Map<String, dynamic> body = {
      "fullName": fullName.text,
      "mail": email.text,
      "text": text.text,
      "topic": topic.text,
      "watched": false,
    };
    _baseAPI
        .fetchData(ManagerAddress.baseContact,
            body: body, method: ApiMethod.POST)
        .then((value) async {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            Fluttertoast.showToast(msg: "Thank you for contacting us");
            fullName.clear();
            email.clear();
            topic.clear();
            text.clear();
          }
        default:
          {
            printLogError('FAILED');
            Fluttertoast.showToast(msg: "Send messenger fail");
          }
      }
    });
  }
}
