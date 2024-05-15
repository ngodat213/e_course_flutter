import 'package:chewie/chewie.dart';
import 'package:e_course_flutter/api/base_api.dart';
import 'package:e_course_flutter/controller/home_screen_controller.dart';
import 'package:e_course_flutter/managers/manager_address.dart';
import 'package:e_course_flutter/models/course_lesson.dart';
import 'package:e_course_flutter/models/models.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class CourseDetailController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<Course> course = Course().obs;
  Rx<CourseVideo> currentVideo = const CourseVideo().obs;

  late VideoPlayerController videoPlayerController;
  late Future<void> initializeVideoPlayerFuture;
  late ChewieController chewieController;

  late TabController tabController;
  final HomeController _homeController = Get.find<HomeController>();
  RxList<CourseLesson> courseLessons = RxList<CourseLesson>();

  final BaseAPI _baseAPI = BaseAPI();

  final RxBool _isShowLoading = false.obs;

  bool get isShowLoading => _isShowLoading.value;

  set isShowLoading(bool isShowLoading) {
    _isShowLoading.value = isShowLoading;
  }

  var status = true.obs;

  void toggleTabs() {
    status.value = !status.value;
  }

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    course.value = _homeController.currentCourse.value;
    handleCourseLesson();
    initVideoPlayer(course.value.videoIntroduce!);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    videoPlayerController.dispose();
    chewieController.dispose();
    super.onClose();
  }

  void initVideoPlayer(String videoUrl) {
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(videoUrl));
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
  }

  Future<void> handleCourseLesson() async {
    _isShowLoading.value = true;
    await _baseAPI
        .fetchData(ManagerAddress.baseCourseLesson + course.value.id!,
            method: ApiMethod.GET)
        .then((value) async {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            courseLessons.value = List<CourseLesson>.from(
                value.object.map((x) => CourseLesson.fromDoc(x)));
            for (CourseLesson lesson in courseLessons) {
              await _baseAPI
                  .fetchData(ManagerAddress.baseVideosOfLesson + lesson.id!,
                      method: ApiMethod.GET)
                  .then((value) {
                switch (value.apiStatus) {
                  case ApiStatus.SUCCEEDED:
                    {
                      lesson.videos = List<CourseVideo>.from(
                          value.object.map((x) => CourseVideo.fromDoc(x)));
                    }
                  default:
                    {
                      printLogError('FAILED');
                      Fluttertoast.showToast(msg: "Get data fail");
                    }
                }
                return null;
              });
            }
          }

        default:
          {
            printLogError('FAILED');
            Fluttertoast.showToast(msg: "Get data fail");
          }
      }
    });
    _isShowLoading.value = false;
  }

  void onPressVideo(CourseVideo obj) {
    if (obj.id != "") {
      currentVideo.value = obj;
      initVideoPlayer(obj.videoUrl!);
    }
  }
}
