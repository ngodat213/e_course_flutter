import 'package:e_course_flutter/controller/onboarding_controller.dart';
import 'package:e_course_flutter/managers/manager_path_routes.dart';
import 'package:e_course_flutter/screens/onboarding_screen/widgets/onboarding_page.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:e_course_flutter/themes/images.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:e_course_flutter/widgets/build_button.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.indicator,
            onPageChanged: ((value) => {controller.page.value = value}),
            children: const [
              OnboardingPage(
                title: 'Learn Everything',
                svgPath: Images.onboarding1,
                description:
                    '"Welcome aboard! Get ready to dive into a world of learning. We\'re excited to have you join us on this educational journey."',
              ),
              OnboardingPage(
                title: 'Learn Everything',
                svgPath: Images.onboarding2,
                description:
                    '"Welcome aboard! Get ready to dive into a world of learning. We\'re excited to have you join us on this educational journey."',
              ),
              OnboardingPage(
                title: 'Learn Everything',
                svgPath: Images.onboarding3,
                description:
                    '"Welcome aboard! Get ready to dive into a world of learning. We\'re excited to have you join us on this educational journey."',
              )
            ],
          ),
          Container(
            alignment: const Alignment(0.8, -0.85),
            child: GestureDetector(
              onTap: () {
                Get.offAllNamed(ManagerRoutes.signInScreen);
              },
              child: Text('Skip', style: TxtStyle.pBold),
            ),
          ),
          Obx(
            () => Container(
              alignment: const Alignment(0, 0.85),
              child: controller.page.value != 2
                  ? SmoothPageIndicator(
                      controller: controller.indicator,
                      count: 3,
                      effect: const SlideEffect(
                        activeDotColor: AppColors.main,
                        spacing: 8,
                        radius: 4.0,
                        dotWidth: 8,
                        dotHeight: 8,
                        dotColor: AppColors.grey,
                      ),
                    )
                  : BuildButton(
                      text: 'Setting Started',
                      duration: const Duration(seconds: 2),
                      curve: Curves.easeInOut,
                      onTap: () {
                        Get.offAllNamed(ManagerRoutes.signInScreen);
                      },
                    ),
            ),
          )
        ],
      ),
    );
  }
}
