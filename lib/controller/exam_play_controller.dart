import 'dart:async';

import 'package:e_course_flutter/api/base_api.dart';
import 'package:e_course_flutter/controller/exam_detail_controller.dart';
import 'package:e_course_flutter/enums/state_play.dart';
import 'package:e_course_flutter/models/models.dart';
import 'package:get/get.dart';

class ExamPlayController extends GetxController {
  final ExamDetailController examDetailController =
      Get.find<ExamDetailController>();

  late ExamLesson currentLesson;
  late List<int> userChooise;
  late Timer timer;
  late String min, sec;
  late int hour = 0;
  late int userCorrect;
  late double point;
  late int fail;

  Rx<StatePlay> state = Rx<StatePlay>(StatePlay.PLAY);
  Rx<Duration> duration = const Duration().obs;
  RxInt currentIndex = 0.obs;

  final BaseAPI _baseAPI = BaseAPI();

  final RxBool _isShowLoading = false.obs;

  bool get isShowLoading => _isShowLoading.value;

  set isShowLoading(bool isShowLoading) {
    _isShowLoading.value = isShowLoading;
  }

  @override
  void onInit() {
    _isShowLoading.value = true;
    initLesson();
    initData();
    setDuration();
    startTimer();
    _isShowLoading.value = false;
    super.onInit();
  }

  void initData() {
    userChooise = RxList.filled(currentLesson.questions!.length, -1);
    hour = 0;
    min = "";
    sec = "";
  }

  void initLesson() {
    currentLesson = examDetailController.currentLesson.value;
  }

  void formatTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    hour = duration.value.inHours.remainder(60);
    min = twoDigits(duration.value.inMinutes.remainder(60));
    sec = twoDigits(duration.value.inSeconds.remainder(60));
  }

  void setDuration() {
    duration.value = Duration(
        hours: currentLesson.hour!,
        minutes: currentLesson.minute!,
        seconds: currentLesson.second!);
  }

  void addTime() {
    final second = duration.value.inSeconds - 1;
    if (second < 0) {
      state.value = StatePlay.COMMIT;
    } else {
      duration.value = Duration(seconds: second);
    }
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) => addTime());
  }

  void onPressNext() {
    if (currentIndex.value < currentLesson.questions!.length - 1) {
      currentIndex.value++;
    }
  }

  void onPressBack() {
    if (currentIndex.value > 0) {
      currentIndex.value--;
    }
  }

  void cancelDialog() {
    Get.back();
  }

  void commitDialog() {
    state.value = StatePlay.COMMIT;
    List<int> res = userChooise;
    userCorrect = 0;
    fail = 0;
    for (int i = 0; i < currentLesson.questions!.length; i++) {
      if (res[i] == currentLesson.questions![i].answer) {
        res[i] = 5;
        userCorrect++;
      } else {
        fail++;
      }
    }

    userChooise = res;
    currentIndex.value = 0;
    point =
        (currentLesson.point! / currentLesson.questions!.length) * userCorrect;
    Get.back();
  }

  void onPressCheckResult() {
    state.value = StatePlay.RESULT;
  }

  int getColorResult(int index) {
    final indexQuesiton = currentIndex.value;
    if (userChooise[indexQuesiton] != -1) {
      if (userChooise[indexQuesiton] == 5 &&
          currentLesson.questions![indexQuesiton].answer == index) {
        return 1;
      } else if (userChooise[currentIndex.value] != 5) {
        if (currentLesson.questions![indexQuesiton].answer == index) {
          return 1;
        } else if (userChooise[indexQuesiton] == index) {
          return 2;
        }
      }
    } else if (currentLesson.questions![indexQuesiton].answer == index) {
      return -1;
    }
    return -1;
  }
}
