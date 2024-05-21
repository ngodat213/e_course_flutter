import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:flutter/material.dart';

class AboutUsWidget extends StatelessWidget {
  const AboutUsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 70),
          Text(
            "${S.of(context).appInfo}: ${S.of(context).app_name}",
            style: TxtStyle.text.copyWith(height: 1.5),
          ),
          const SizedBox(height: 10),
          Text(
            "${S.of(context).version}: 1.0",
            style: TxtStyle.text.copyWith(height: 1.5),
          ),
          const SizedBox(height: 10),
          Text(
            "${S.of(context).for4}: ${S.of(context).iOSAndroid}",
            style: TxtStyle.text.copyWith(height: 1.5),
          ),
          const SizedBox(height: 10),
          Text(
            S.of(context).infoApp,
            style: TxtStyle.text.copyWith(
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
