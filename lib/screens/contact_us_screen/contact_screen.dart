import 'package:e_course_flutter/controller/contact_us_controller.dart';
import 'package:e_course_flutter/generated/l10n.dart';
import 'package:e_course_flutter/screens/contact_us_screen/widgets/contact_widget.dart';
import 'package:e_course_flutter/widgets/back_button.dart';
import 'package:e_course_flutter/widgets/title_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactScreen extends GetView<ContactUsController> {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              const ContactWidget(),
              TitleScreen(title: S.of(context).commonInfo),
              BuildBackButton(top: 24),
            ],
          ),
        ),
      ),
    );
  }
}
