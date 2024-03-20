import 'package:e_course_flutter/controller/signin_controller.dart';
import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/managers/manager_path_routes.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/images.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:e_course_flutter/widgets/base_text.dart';
import 'package:e_course_flutter/widgets/build_button.dart';
import 'package:e_course_flutter/widgets/build_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends GetView<SignInController> {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _signInAppbar(context),
      body: signinContent(context),
    );
  }

  SingleChildScrollView signinContent(BuildContext context) {
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
              controller: controller.passwordController,
              hintText: S.of(context).passwordExample,
            ),
            _forgotPwButton(context),
            const SizedBox(height: 20),
            _loginButton(context),
            const SizedBox(height: 20),
            _signUpButton(context)
          ],
        ),
      ),
    );
  }

  Align _forgotPwButton(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: () {
          Get.toNamed(ManagerRoutes.forgotPwScreen);
        },
        child: Text(
          S.of(context).forgotPasswordAnswer,
          style: TxtStyle.text,
        ),
      ),
    );
  }

  BuildButton _loginButton(BuildContext context) {
    return BuildButton(
      text: S.of(context).login,
      onTap: () {
        controller.onPressLogin(context);
      },
      duration: const Duration(seconds: 2),
      curve: Curves.easeInOut,
    );
  }

  Row _signUpButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).dontHaveAccount,
          style: TxtStyle.text,
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed(ManagerRoutes.signUpScreen);
          },
          child: Text(
            S.of(context).signUp,
            style: TxtStyle.text
                .copyWith(color: AppColors.main, fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
  }

  AppBar _signInAppbar(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.all(23),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BaseText(
              text: S.of(context).login,
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
    );
  }
}
