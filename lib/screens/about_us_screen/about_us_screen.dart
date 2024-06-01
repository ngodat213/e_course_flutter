import 'package:e_course_flutter/controller/contact_us_controller.dart';
import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/screens/about_us_screen/widgets/about_us_widget.dart';
import 'package:e_course_flutter/widgets/back_button.dart';
import 'package:e_course_flutter/widgets/title_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUsScreen extends GetView<ContactUsController> {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              const AboutUsWidget(),
              TitleScreen(title: S.of(context).aboutUs),
              BuildBackButton(top: 24),
            ],
          ),
        ),
      ),
    );
  }
}
