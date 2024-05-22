import 'package:e_course_flutter/controller/course_detail_controller.dart';
import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/widgets/build_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterButton extends GetView<CourseDetailController> {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildButton(
      text: S.of(context).register,
      onTap: () {
        controller.onPressRegister();
      },
      duration: const Duration(seconds: 2),
      curve: Curves.easeInOut,
    );
  }
}
