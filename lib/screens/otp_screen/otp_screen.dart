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
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPScreen extends GetView<ForgotPwController> {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(23),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              text: S.of(context).enterCodeSend,
              style: TxtStyle.text.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            PinCodeTextField(
              appContext: context,
              length: 7,
              keyboardType: TextInputType.number,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(4),
                fieldHeight: 50,
                fieldWidth: 50,
                inactiveColor: AppColors.label,
                selectedColor: AppColors.label,
                activeColor: AppColors.main,
              ),
              cursorColor: AppColors.input,
              controller: controller.otpTextEditController,
              autoDisposeControllers: false,
            ),
            const SizedBox(height: 20),
            BuildTextField(
              label: S.of(context).password,
              isPassword: true,
              hintText: S.of(context).passwordExample,
              controller: controller.passwordTextEditController,
            ),
            const SizedBox(height: 20),
            BuildTextField(
              label: S.of(context).confirmPassword,
              isPassword: true,
              hintText: S.of(context).passwordExample,
              controller: controller.newPasswordTextEditController,
            ),
            const SizedBox(height: 20),
            Center(
              child: BuildButton(
                text: S.of(context).changePassword,
                duration: const Duration(seconds: 2),
                curve: Curves.easeInOut,
                onTap: () {
                  controller.onPressChangePassword();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
