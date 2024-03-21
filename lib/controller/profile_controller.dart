import 'dart:typed_data';

import 'package:e_course_flutter/controller/signin_controller.dart';
import 'package:e_course_flutter/models/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final SignInController _signInController = Get.find<SignInController>();
  late User currentUser;

  late TabController _tabController;
  Uint8List? _image;
  @override
  void onInit() {
    // _tabController = TabController(length: 2, vsync: this);
    currentUser = _signInController.currentAccount.value;
    super.onInit();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // void selectImage() async {
  //   Uint8List img = await ImagePickerProfile.pickImage(ImageSource.gallery);
  //   setState(() {
  //     _image = img;
  //   });
  //   await ImagePickerProfile.uploadImage();
  //   setState(() {
  //     context.read<SettingCubit>().handleGetUser();
  //   });
  // }
}
