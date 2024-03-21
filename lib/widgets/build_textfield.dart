import 'package:e_course_flutter/widgets/base_text.dart';
import 'package:flutter/material.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:get/get.dart';

class BuildTextField extends StatelessWidget {
  BuildTextField({
    super.key,
    this.isPassword,
    this.isNumber,
    this.func,
    this.label,
    this.controller,
    required this.hintText,
  });
  final String hintText;
  String? label;
  bool? isPassword = false;
  bool? isNumber = false;
  void Function(String value)? func;
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != ""
            ? Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: BaseText(
                  text: label ?? "",
                  style: TxtStyle.text.copyWith(fontWeight: FontWeight.w600),
                ),
              )
            : Container(),
        Container(
          height: 40,
          width: Get.width * 0.85,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.grey)),
          child: TextField(
            controller: controller,
            autocorrect: true,
            onChanged: (value) => func!(value),
            keyboardType: isNumber == true ? TextInputType.number : null,
            obscureText: isPassword ?? false,
            style: TxtStyle.pBold,
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: const EdgeInsets.fromLTRB(10, 0, 16, 10),
              labelStyle: TxtStyle.p,
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
