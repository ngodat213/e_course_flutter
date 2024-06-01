import 'package:e_course_flutter/controller/change_language_controller.dart';
import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/images.dart';
import 'package:e_course_flutter/widgets/back_button.dart';
import 'package:e_course_flutter/widgets/items_language.dart';
import 'package:e_course_flutter/widgets/title_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

class ChangeLanguageScreen extends GetView<ChangeLanguageController> {
  const ChangeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  Obx(() {
                    final indexLang = controller.index.value;
                    return ListView.builder(
                      itemCount: controller.langData.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ItemLanguage(
                          onTap: () async {
                            await controller.changeLang(index);
                          },
                          assetName: controller.langData[index].urlIcon,
                          nameLang: controller.langData[index].title,
                          iconChecked: indexLang == index
                              ? SvgPicture.asset(
                                  Images.iconCheck,
                                  width: 16,
                                  color: AppColors.main,
                                )
                              : const Text(''),
                        );
                      },
                    );
                  })
                ],
              ),
            ),
            TitleScreen(title: S.of(context).changeLanguage),
            BuildBackButton(top: 24),
          ],
        )),
      ),
    );
  }
}
