import 'package:e_course_flutter/controller/profile_controller.dart';
import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/screens/profile_screen/widget/changed_profile.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:e_course_flutter/widgets/build_button.dart';
import 'package:e_course_flutter/widgets/build_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildUserSetting extends GetView<ProfileController> {
  const BuildUserSetting({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            _displayBottomSheet(
              context,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).username,
                    style: TxtStyle.h3,
                  ),
                  const SizedBox(height: 20),
                  BuildTextField(
                    label: S.of(context).username,
                    hintText: controller.currentAccount.username!,
                    func: (value) {
                      // context.read<ProfileCubit>().userNameChanged(value);
                    },
                  ),
                  const SizedBox(height: 20),
                  BuildButton(
                    text: S.of(context).save,
                    onTap: () {
                      Get.back();
                    },
                    duration: const Duration(seconds: 2),
                    curve: Curves.easeInOut,
                  ),
                ],
              ),
            );
          },
          child: ChangedProfile(
            title: S.of(context).username,
            text: controller.currentAccount.username!,
          ),
        ),
        const Divider(),
        GestureDetector(
          onTap: () {
            _displayBottomSheet(
              context,
              height: 440,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).email,
                    style: TxtStyle.h3,
                  ),
                  const SizedBox(height: 20),
                  BuildTextField(
                    label: S.of(context).oldEmail,
                    hintText: controller.currentAccount.email!,
                    func: (value) {
                      // context.read<ProfileCubit>().oldEmailChanged(value);
                    },
                  ),
                  const SizedBox(height: 20),
                  BuildTextField(
                    label: S.of(context).newEmail,
                    hintText: S.of(context).emailExample,
                    func: (value) {
                      // context.read<ProfileCubit>().emailChanged(value);
                    },
                  ),
                  const SizedBox(height: 20),
                  BuildTextField(
                    label: S.of(context).password,
                    isPassword: true,
                    hintText: S.of(context).passwordExample,
                    func: (value) {
                      // context.read<ProfileCubit>().passwordChanged(value);
                    },
                  ),
                  const SizedBox(height: 20),
                  BuildButton(
                    text: S.of(context).save,
                    onTap: () {},
                    duration: const Duration(seconds: 2),
                    curve: Curves.easeInOut,
                  ),
                ],
              ),
            );
          },
          child: ChangedProfile(
            title: S.of(context).emailAddress,
            text: controller.currentAccount.email!,
          ),
        ),
        const Divider(),
        GestureDetector(
          onTap: () {
            _displayBottomSheet(
              context,
              height: 440,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).resetPassword,
                    style: TxtStyle.h3,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    S.of(context).resetPasswordDescription,
                    style: TxtStyle.text,
                  ),
                  const SizedBox(height: 20),
                  BuildTextField(
                      label: S.of(context).email,
                      hintText: controller.currentAccount.email!),
                  const SizedBox(height: 20),
                  BuildTextField(
                      label: S.of(context).password,
                      isPassword: true,
                      hintText: S.of(context).passwordExample),
                  const SizedBox(height: 20),
                  BuildButton(
                    text: S.of(context).send,
                    duration: const Duration(seconds: 2),
                    curve: Curves.easeInOut,
                  ),
                ],
              ),
            );
          },
          child: ChangedProfile(
            title: S.of(context).resetPassword,
            text: S.of(context).resetPasswordTitle,
          ),
        ),
      ],
    );
  }
}

Future _displayBottomSheet(BuildContext context,
    {required Widget child, double? height}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    barrierColor: AppColors.grey.withOpacity(0.6),
    isDismissible: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
    builder: (context) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          height: height ?? 300,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: AppColors.shadow,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Center(
                child: Container(
                  width: 50,
                  height: 3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black),
                ),
              ),
              const SizedBox(height: 50),
              child
            ],
          ),
        ),
      );
    },
  );
}
