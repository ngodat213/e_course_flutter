import 'package:e_course_flutter/controller/signup_controller.dart';
import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/images.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:e_course_flutter/widgets/base_text.dart';
import 'package:e_course_flutter/widgets/build_button.dart';
import 'package:e_course_flutter/widgets/build_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _signupAppbar(),
      body: _signupContent(context),
    );
  }

  Widget _signupContent(BuildContext context) {
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
              text: S.of(context).username,
              style: TxtStyle.text.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            BuildTextField(
              controller: controller.usernameController,
              hintText: S.of(context).username,
            ),
            const SizedBox(height: 20),
            BaseText(
              text: S.of(context).email,
              style: TxtStyle.text.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            BuildTextField(
              controller: controller.emailController,
              hintText: S.of(context).emailExample,
            ),
            const SizedBox(height: 20),
            BaseText(
              text: S.of(context).password,
              style: TxtStyle.text.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            BuildTextField(
              isPassword: true,
              controller: controller.pwController,
              hintText: S.of(context).passwordExample,
            ),
            const SizedBox(height: 20),
            BaseText(
              text: S.of(context).confirmPassword,
              style: TxtStyle.text.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            BuildTextField(
              isPassword: true,
              controller: controller.confirmPwController,
              hintText: S.of(context).passwordExample,
            ),
            const SizedBox(height: 20),
            BuildButton(
              text: 'Login',
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOut,
              onTap: () {
                controller.onPressSignUp(context);
              },
            )
          ],
        ),
      ),
    );
  }

  AppBar _signupAppbar() {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.all(23),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BaseText(
              text: 'Create Your Account',
              textAlign: TextAlign.center,
              style: TxtStyle.h3.copyWith(color: AppColors.input),
              duration: const Duration(milliseconds: 1500),
              curve: Curves.easeInOut,
            ),
            BaseText(
              text: 'Create your account to start learning',
              textAlign: TextAlign.center,
              style: TxtStyle.p.copyWith(color: AppColors.label),
              duration: const Duration(milliseconds: 1500),
              curve: Curves.easeInOut,
            )
          ],
        ),
      ),
    );
  }
}
