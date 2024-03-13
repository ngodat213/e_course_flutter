import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/managers/manager_path_routes.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/images.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SettingMenu extends StatelessWidget {
  const SettingMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(width: 4, color: Color(0xFFF6F6F6)),
        ),
      ),
      child: Column(
        children: [
          SettingTile(
            svgPath: Images.iconPerson,
            text: S.of(context).account,
            subtitle: S.of(context).accountSetting,
            iconColor: AppColors.label,
            onTap: () {
              Get.toNamed(ManagerRoutes.profileScreen);
            },
          ),
          const _CustomDivider(),
          SettingTile(
            svgPath: Images.iconFavorite,
            text: S.of(context).myFavorite,
            subtitle: S.of(context).courseFavorite,
            iconColor: AppColors.label,
            onTap: () {
              Get.toNamed(ManagerRoutes.favoriteScreen);
            },
          ),
          const _CustomDivider(),
          SettingTile(
            svgPath: Images.iconGlobal,
            text: S.of(context).language,
            subtitle: "English",
            onTap: () {
              Get.toNamed(ManagerRoutes.changeLanguage);
            },
          ),
          const _CustomDivider(),
          SettingTile(
            svgPath: Images.iconInfo,
            text: S.of(context).about,
            subtitle: S.of(context).aboutUs,
            onTap: () {
              // context.read<CommoInfoCubit>().indexChanged(0);
              Get.toNamed(ManagerRoutes.commoInfoScreen);
            },
          ),
          const _CustomDivider(),
          SettingTile(
            svgPath: Images.iconChat,
            text: S.of(context).help,
            subtitle: S.of(context).contactUs,
            onTap: () {
              // context.read<CommoInfoCubit>().indexChanged(1);
              Get.toNamed(ManagerRoutes.commoInfoScreen);
            },
          ),
        ],
      ),
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider();

  @override
  Widget build(BuildContext context) {
    return const Divider(height: 1, color: AppColors.grey);
  }
}

class SettingTile extends StatelessWidget {
  const SettingTile({
    super.key,
    required this.svgPath,
    required this.text,
    required this.subtitle,
    this.iconColor,
    this.onTap,
    this.color,
  });
  final Color? iconColor;
  final String svgPath;
  final String text;
  final String subtitle;
  final Color? color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: CircleAvatar(
          backgroundColor: Colors.white.withOpacity(0),
          child: SvgPicture.asset(
            svgPath,
            color: iconColor,
            width: 24,
          ),
        ),
        title: Text(
          text,
          style: TxtStyle.inputStyle
              .copyWith(fontWeight: FontWeight.w600, color: color),
        ),
        subtitle: Text(
          subtitle,
          style: TxtStyle.labelStyle.copyWith(color: color),
        ),
      ),
    );
  }
}
