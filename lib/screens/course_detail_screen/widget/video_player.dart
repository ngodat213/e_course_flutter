import 'package:chewie/chewie.dart';
import 'package:e_course_flutter/controller/course_detail_controller.dart';
import 'package:e_course_flutter/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoPlayWidget extends GetView<CourseDetailController> {
  const VideoPlayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: AspectRatio(
              aspectRatio: controller.videoPlayerController.value.aspectRatio,
              child: Chewie(controller: controller.chewieController),
            ),
          );
        } else {
          return Container(
            height: 200,
            width: MediaQuery.of(context).size.width - 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(controller.course.value.imageIntroduce!),
                fit: BoxFit.cover,
              ),
              color: AppColors.main,
              borderRadius: BorderRadius.circular(8),
            ),
          );
        }
      },
    );
  }
}
