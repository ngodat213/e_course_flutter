import 'package:e_course_flutter/controller/home_screen_controller.dart';
import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeUserWidget extends GetView<HomeController> {
  const WelcomeUserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: Obx(
          () => controller.isShowLoading
              ? Container()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            '${S.of(context).hi}, ${controller.currentAccount.value.username}',
                            style: TxtStyle.title),
                        const SizedBox(height: 2),
                        Text(S.of(context).progressTitle,
                            style: TxtStyle.hintStyle),
                      ],
                    ),
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          controller.currentAccount.value.photoUrl!),
                    )
                  ],
                ),
        ));
  }
}
