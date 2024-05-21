import 'package:e_course_flutter/controller/contact_us_controller.dart';
import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:e_course_flutter/widgets/build_button.dart';
import 'package:e_course_flutter/widgets/build_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactWidget extends GetView<ContactUsController> {
  const ContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
      child: Column(
        children: [
          const SizedBox(height: 70),
          Text(
            S.of(context).contactUsTitle,
            style: TxtStyle.text,
          ),
          const SizedBox(height: 30),
          BuildTextField(
            label: S.of(context).name,
            hintText: S.of(context).username,
            controller: controller.fullName,
          ),
          const SizedBox(height: 20),
          BuildTextField(
            label: S.of(context).email,
            hintText: S.of(context).emailAddress,
            controller: controller.email,
          ),
          const SizedBox(height: 30),
          BuildTextField(
            label: S.of(context).topic,
            hintText: S.of(context).topicInfo,
            controller: controller.topic,
          ),
          const SizedBox(height: 20),
          _TextField(
            textEditingController: controller.text,
          ),
          const SizedBox(height: 20),
          BuildButton(
            text: S.of(context).summitMessage,
            onTap: () {
              controller.onChangedSend();
            },
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOut,
          ),
        ],
      ),
    );
  }
}

class _TextField extends GetView<ContactUsController> {
  _TextField({this.textEditingController});
  @override
  TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: AppColors.shadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          TextFormField(
            controller: textEditingController,
            minLines: 10,
            maxLines: 20,
            keyboardType: TextInputType.multiline,
            style: TxtStyle.inputStyle,
            decoration: InputDecoration(
              isDense: true,
              hintText: S.of(context).text,
              contentPadding: const EdgeInsets.symmetric(vertical: 6),
              labelStyle: TxtStyle.labelStyle,
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }
}
