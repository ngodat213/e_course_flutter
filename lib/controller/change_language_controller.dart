import 'package:e_course_flutter/models/language.dart';
import 'package:e_course_flutter/utils/localization_managet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeLanguageController extends GetxController {
  final _localizationManager = LocalizationManager();
  Rx<Locale> locale = Rx<Locale>(const Locale('en'));
  RxInt index = 0.obs;

  List<Language> langData = [
    Language(
        urlIcon:
            'https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Flag_of_the_United_States.svg/1280px-Flag_of_the_United_States.svg.png',
        title: 'English'),
    Language(
        urlIcon:
            'https://static.wikia.nocookie.net/doraemon/images/a/a2/1599px-Flag_of_Vietnam.svg.png/revision/latest/scale-to-width-down/1599?cb=20200120095413&path-prefix=en',
        title: 'Vietnamese')
  ];

  Future<void> changeLang(int indexLag) async {
    switch (indexLag) {
      case 0:
        await _localizationManager.saveLocalization(indexLag);
        locale.value = const Locale('en');
        index.value = indexLag;
        break;
      case 1:
        await _localizationManager.saveLocalization(indexLag);
        locale.value = const Locale('vi');
        index.value = indexLag;
        break;
    }
  }

  Future<void> getLang() async {
    final lang = await _localizationManager.getLocalization();
    switch (lang) {
      case 0:
        locale.value = const Locale('en');
        index.value = 0;
        break;
      case 1:
        locale.value = const Locale('vi');
        index.value = 1;
        break;
    }
  }
}
