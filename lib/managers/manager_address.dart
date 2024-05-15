/// ## Manager Address contain all the information about the manager address.
/// * [domain] is the domain of the api app
/// * Example:
/// ```dart
/// import 'package:trygo/manager/manager_address.dart';
/// ...
/// url : ManagerAddress.domain;
/// ...
/// ```
class ManagerAddress {
  ManagerAddress._();
  static String domain = '';
  //?--        BASE URL       -->
  //?-- ACCOUNT -->
  static const String baseAccount = 'users';
  static const String accountLogin = '$baseAccount/login/';
  static const String accountCurrent = '$baseAccount/current/';
  static const String accountSignup = '$baseAccount/signup/';

  //?-- Course -->
  static const String baseCourse = 'courses';
  static const String baseCourseLesson = '$baseCourse/lessons/';
  static const String baseVideosOfLesson = '${baseCourseLesson}videos/';
  static const String baseCourseVideo = '$baseCourse/videos/';

  //?-- Quiz -->
  static const String baseQuiz = 'quiz/';
  static const String baseQuizLesson = '$baseQuiz/lessons/';
  static const String baseQuizQuestion = '$baseQuiz/questions';

  //?-- CATEGORY -->
  static const String baseCategory = 'categorys/';
  static const String baseFeedback = 'feedbacks/';
}
