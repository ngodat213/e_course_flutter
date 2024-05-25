import 'package:e_course_flutter/controller/course_detail_controller.dart';
import 'package:e_course_flutter/models/course_feedback.dart';
import 'package:e_course_flutter/widgets/build_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:e_course_flutter/themes/images.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class TabReview extends GetView<CourseDetailController> {
  const TabReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 28),
        child: Column(
          children: [
            Obx(
              () => controller.isFeedback.value ||
                      controller.isOrder.value == false
                  ? Container()
                  : Column(
                      children: [
                        RatingBar.builder(
                          initialRating: 5,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 30,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            controller.onRatingUpdate(rating);
                          },
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  controller.currentUser.photoUrl!),
                            ),
                            const SizedBox(width: 10),
                            BuildTextField(
                              hintText: 'Your feedback',
                              width: Get.width * 0.65,
                              controller: controller.feedbackEditingController,
                            ),
                            const SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                controller.onPressFeedback();
                              },
                              child: const Icon(Icons.send_rounded),
                            )
                          ],
                        ),
                      ],
                    ),
            ),
            Obx(
              () => Column(
                children: controller.feedbacks
                    .map(
                      (e) => GestureDetector(
                        onTap: () {
                          // controller.onPressCourse(e);
                        },
                        child: FeedbackCard(feedback: e),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeedbackCard extends StatelessWidget {
  const FeedbackCard({
    required this.feedback,
    super.key,
  });
  final CourseFeedback feedback;

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('dd MMMM yyyy').format(feedback.createdAt!);
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(child: Image.network(feedback.user!.photoUrl!)),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  feedback.user!.username!,
                  style: TxtStyle.text.copyWith(fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(feedback.rating!, (index) {
                        return SvgPicture.asset(Images.iconStar, width: 12);
                      }),
                    ),
                    const SizedBox(width: 8),
                    Text('• $formattedDate', style: TxtStyle.time),
                  ],
                )
              ],
            )
          ],
        ),
        const SizedBox(height: 8),
        Text(
          feedback.title!,
          style: TxtStyle.labelStyle,
        ),
        const SizedBox(height: 28),
      ],
    );
  }
}
