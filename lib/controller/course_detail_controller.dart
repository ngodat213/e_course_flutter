import 'package:chewie/chewie.dart';
import 'package:e_course_flutter/api/base_api.dart';
import 'package:e_course_flutter/controller/home_screen_controller.dart';
import 'package:e_course_flutter/controller/main_controller.dart';
import 'package:e_course_flutter/enums/payment.dart';
import 'package:e_course_flutter/enums/payment_status.dart';
import 'package:e_course_flutter/managers/manager_address.dart';
import 'package:e_course_flutter/managers/manager_key_storage.dart';
import 'package:e_course_flutter/models/course_feedback.dart';
import 'package:e_course_flutter/models/course_lesson.dart';
import 'package:e_course_flutter/models/models.dart';
import 'package:e_course_flutter/themes/text_styles.dart';
import 'package:e_course_flutter/utils/base_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class CourseDetailController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final HomeController _homeController = Get.find<HomeController>();
  final MainController _mainController = Get.find<MainController>();
  final TextEditingController feedbackEditingController =
      TextEditingController();

  late VideoPlayerController videoPlayerController;
  late Future<void> initializeVideoPlayerFuture;
  late ChewieController chewieController;
  late RxBool isFav;
  late RxBool isOrder;
  late RxBool isFeedback = false.obs;
  late TabController tabController;
  late User currentUser;
  late int rating;

  Rx<Course> course = Course().obs;
  Rx<CourseVideo> currentVideo = const CourseVideo().obs;
  RxList<CourseLesson> courseLessons = RxList<CourseLesson>();
  RxList<CourseFeedback> feedbacks = RxList<CourseFeedback>();

  final BaseAPI _baseAPI = BaseAPI();

  final RxBool _isShowLoading = false.obs;

  bool get isShowLoading => _isShowLoading.value;

  set isShowLoading(bool isShowLoading) {
    _isShowLoading.value = isShowLoading;
  }

  @override
  void onInit() async {
    _isShowLoading.value = true;
    tabController = TabController(length: 2, vsync: this);
    handleCurrentCourse();
    handleUser();
    handleIsFav();
    handleIsOrder();
    await handleIsFeedback();
    handleFeedback();
    await handleCourseLesson();
    initVideoPlayer(course.value.videoIntroduce!);
    _isShowLoading.value = false;
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    videoPlayerController.dispose();
    chewieController.dispose();
    super.onClose();
  }

  void handleUser() {
    currentUser = _mainController.currentAccount.value;
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

  void handleFeedback() {
    Map<String, dynamic> params = {
      "qCourse": course.value.id,
    };
    _baseAPI
        .fetchData(ManagerAddress.baseFeedback,
            method: ApiMethod.GET, params: params)
        .then((value) async {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            feedbacks.value = List<CourseFeedback>.from(
                value.object.map((x) => CourseFeedback.fromJson(x)));
          }
        default:
          {
            printLogError('FAILED');
            Fluttertoast.showToast(msg: "Get data fail");
          }
      }
    });
  }

  Future<void> handleIsFeedback() async {
    final User user = _mainController.currentAccount.value;
    Map<String, dynamic> params = {
      "qUser": user.id,
      "qCourse": course.value.id,
    };
    _baseAPI
        .fetchData(ManagerAddress.baseFeedback,
            method: ApiMethod.GET, params: params)
        .then((value) async {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            final feedbacks = List<CourseFeedback>.from(
                value.object.map((x) => CourseFeedback.fromJson(x)));
            print("feedback $feedbacks");
            if (feedbacks.isNotEmpty) {
              isFeedback.value = true;
              print("feedback1 ${isFeedback.value}");
            } else {
              isFeedback.value = false;
              print("feedback2 ${isFeedback.value}");
            }
          }
        default:
          {
            printLogError('FAILED');
            Fluttertoast.showToast(msg: "Get data fail");
          }
      }
    });
  }

  void handleIsFav() {
    final User user = _mainController.currentAccount.value;
    if (user.favouritesCourses!.contains(course.value.id)) {
      isFav = true.obs;
    } else {
      isFav = false.obs;
    }
  }

  void handleIsOrder() {
    final User user = _mainController.currentAccount.value;
    if (user.courses!.contains(course.value.id)) {
      isOrder = true.obs;
    } else {
      isOrder = false.obs;
    }
    print("courses: ${user.courses}");
    print("Is order ${isOrder.value}");
  }

  void handleCurrentCourse() {
    course.value = _homeController.currentCourse.value;
  }

  Future<void> handleCourseLesson() async {
    await _baseAPI
        .fetchData(ManagerAddress.baseCourseLessonOf + course.value.id!,
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
  }

  void onPressFeedback() async {
    final User user = _mainController.currentAccount.value;
    final String token = await BaseSharedPreferences.getStringValue(
        ManagerKeyStorage.accessToken);
    Map<String, dynamic> body = {
      "user": user.id,
      "course": course.value.id,
      "title": feedbackEditingController.text,
      "rating": rating,
    };

    final headers = {"Authorization": "Bearer $token"};
    _baseAPI
        .fetchData(ManagerAddress.baseFeedback,
            headers: headers, body: body, method: ApiMethod.POST)
        .then((value) async {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            handleFeedback();
            isFeedback.value = false;
            Fluttertoast.showToast(msg: "Thank you your feedback");
            break;
          }
        default:
          {
            Fluttertoast.showToast(msg: "Error");
          }
      }
    });
  }

  void onPressRegister() async {
    final String token = await BaseSharedPreferences.getStringValue(
        ManagerKeyStorage.accessToken);
    final User user = _mainController.currentAccount.value;
    postInOrder(token, user);
    saveInUserOrder(token, user);
  }

  void postInOrder(String token, User currentUser) {
    Map<String, dynamic> body = {
      "user": currentUser.id,
      "course": course.value.id,
      "totalPrice": course.value.price,
      "payment": Payment.MOMO.toString().split('.').last,
      "paymentStatus": PaymentStatus.SUCCESS.toString().split('.').last,
    };

    final headers = {"Authorization": "Bearer $token"};
    _baseAPI
        .fetchData(ManagerAddress.baseOrder,
            headers: headers, body: body, method: ApiMethod.POST)
        .then((value) async {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            _mainController.getCurrentUser();
            handleIsOrder();
            break;
          }
        default:
          {
            Fluttertoast.showToast(msg: "Error");
          }
      }
    });
  }

  void saveInUserOrder(String token, User currentUser) async {
    List<String> courses = currentUser.courses!;

    courses.add(course.value.id!);

    Map<String, dynamic> body = {
      "courses": courses,
    };

    final headers = {"Authorization": "Bearer $token"};
    _baseAPI
        .fetchData(ManagerAddress.baseAccount + currentUser.id!,
            headers: headers, body: body, method: ApiMethod.PUT)
        .then((value) async {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            _mainController.getCurrentUser();
            handleIsOrder();
            break;
          }
        default:
          {
            Fluttertoast.showToast(msg: "Email already exist");
          }
      }
    });
  }

  void onPressFav() async {
    final String token = await BaseSharedPreferences.getStringValue(
        ManagerKeyStorage.accessToken);
    final User user = _mainController.currentAccount.value;
    List<String> favs = user.favouritesCourses!;

    if (isFav == true) {
      favs.remove(course.value.id!);
    } else {
      favs.add(course.value.id!);
    }

    Map<String, dynamic> body = {
      "favouritesCourses": favs,
    };

    final headers = {"Authorization": "Bearer $token"};
    _baseAPI
        .fetchData(ManagerAddress.baseAccount + user.id!,
            headers: headers, body: body, method: ApiMethod.PUT)
        .then((value) async {
      switch (value.apiStatus) {
        case ApiStatus.SUCCEEDED:
          {
            _mainController.getCurrentUser();
            handleIsFav();
            break;
          }
        default:
          {
            Fluttertoast.showToast(msg: "Email already exist");
          }
      }
    });
  }

  void onPressVideo(CourseVideo obj) {
    if (obj.id != "") {
      currentVideo.value = obj;
      initVideoPlayer(obj.videoUrl!);
    }
  }
}
