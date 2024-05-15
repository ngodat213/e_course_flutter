import 'package:chewie/chewie.dart';
import 'package:e_course_flutter/controller/course_detail_controller.dart';
import 'package:e_course_flutter/models/course.dart';
import 'package:e_course_flutter/models/course_video.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class CourseVideoController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final CourseDetailController _courseDetailController =
      Get.find<CourseDetailController>();

  late CourseVideo courseVideo;
  late Course course;

  late VideoPlayerController videoPlayerController;
  late Future<void> initializeVideoPlayerFuture;
  late ChewieController chewieController;
  final TextEditingController commentController = TextEditingController();

  final RxBool _isShowLoading = false.obs;

  bool get isShowLoading => _isShowLoading.value;

  set isShowLoading(bool isShowLoading) {
    _isShowLoading.value = isShowLoading;
  }

  @override
  void onInit() {
    handleCourseVideo();
    handleCourse();
    initVideoPlayer();
    super.onInit();
  }

  @override
  void onClose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    commentController.dispose();
    super.onClose();
  }

  void handleCourseVideo() {
    courseVideo = _courseDetailController.currentVideo.value;
  }

  void handleCourse() {
    course = _courseDetailController.course.value;
  }

  void initVideoPlayer() {
    print("course videoUrl: ${courseVideo.videoUrl}");
    _isShowLoading.value = true;
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(courseVideo.videoUrl!));
    initializeVideoPlayerFuture = videoPlayerController.initialize();
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 16 / 11,
      autoPlay: true,
      looping: false,
      errorBuilder: (context, errorMessage) {
        return Center(child: Text(errorMessage, style: TxtStyle.p));
      },
    );
    _isShowLoading.value = false;
  }
}
