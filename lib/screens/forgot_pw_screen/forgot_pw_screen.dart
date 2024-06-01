import 'package:e_course_flutter/controller/forgot_pw_controller.dart';
import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/images.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:e_course_flutter/widgets/base_text.dart';
import 'package:e_course_flutter/widgets/build_button.dart';
import 'package:e_course_flutter/widgets/build_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPwScreen extends GetView<ForgotPwController> {
  const ForgotPwScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(23),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BaseText(
                text: S.of(context).forgotPassword,
                textAlign: TextAlign.center,
                style: TxtStyle.h3.copyWith(color: AppColors.input),
                duration: const Duration(milliseconds: 1500),
                curve: Curves.easeInOut,
              ),
              BaseText(
                text: S.of(context).hiTitle,
                textAlign: TextAlign.center,
                style: TxtStyle.p.copyWith(color: AppColors.label),
                duration: const Duration(milliseconds: 1500),
                curve: Curves.easeInOut,
              )
            ],
          ),
        ),
      ),
      body: _forgotPwContent(context),
    );
  }

  SingleChildScrollView _forgotPwContent(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(23),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Get.height * 0.26,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Images.signin),
                  scale: 1,
                ),
              ),
            ),
            const SizedBox(height: 20),
            BaseText(
              text: S.of(context).email,
              style: TxtStyle.text.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            BuildTextField(
              hintText: S.of(context).emailExample,
              controller: controller.emailTextEditController,
            ),
            const SizedBox(height: 20),
            BuildButton(
              text: S.of(context).send,
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOut,
              onTap: () {
                controller.onPressSendOTP();
              },
            ),
          ],
        ),
      ),
    );
  }
}
