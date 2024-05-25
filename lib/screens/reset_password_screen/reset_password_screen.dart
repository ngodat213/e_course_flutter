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

class ResetPasswordScreen extends GetView<ForgotPwController> {
  const ResetPasswordScreen({super.key});

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
            ],
          ),
        ),
      ),
      body: _forgotPwContent(context),
    );
  }

  Padding _forgotPwContent(BuildContext context) {
    return Padding(
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
        ],
      ),
    );
  }
}
