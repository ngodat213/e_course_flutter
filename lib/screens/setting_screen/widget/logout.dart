import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/managers/manager_key_storage.dart';
import 'package:e_course_flutter/managers/manager_path_routes.dart';
import 'package:e_course_flutter/screens/setting_screen/widget/setting_menu.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/images.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:e_course_flutter/utils/base_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoutTile extends StatelessWidget {
  const LogoutTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SettingTile(
        svgPath: Images.iconLogout,
        text: S.of(context).logout,
        subtitle: S.of(context).logOutTitle,
        color: const Color(0xFFEA3434),
        onTap: () {
          DialogLogout(context);
        },
      ),
    );
  }

  Future<dynamic> DialogLogout(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Icon(
                  Icons.warning_amber_outlined,
                  color: Color(0xFFEA3434),
                ),
              ),
              Text(
                S.of(context).logout,
                style: TxtStyle.inputStyle.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          content: Text(S.of(context).logout),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(S.of(context).cancel, style: TxtStyle.text),
            ),
            TextButton(
              onPressed: () {
                BaseSharedPreferences.remove(ManagerKeyStorage.accessToken);
                Get.offNamed(ManagerRoutes.signInScreen);
              },
              style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll<Color>(AppColors.main),
              ),
              child: Text(S.of(context).logout, style: TxtStyle.p),
            )
          ],
        );
      },
    );
  }
}
