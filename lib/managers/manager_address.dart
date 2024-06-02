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
  static const String baseAccount = 'users/';
  static const String accountLogin = '${baseAccount}login/';
  static const String accountCurrent = '${baseAccount}current/';
  static const String accountAvatar = '${baseAccount}avatar/';
  static const String accountSignup = '${baseAccount}register/';
  static const String accountForgotPassword = '${baseAccount}forgot-password/';
  static const String accountResetPassword = '${baseAccount}reset-password/';

  //?-- Course -->
  static const String baseCourse = 'course/';
  static const String baseCourseLessonOf = '${baseCourse}lessonsOf/';

  //?-- Course Lesson -->
  static const String baseCourseLesson = 'course_lessons/';
  static const String baseVideosOfLesson = '${baseCourseLesson}videosOf/';

  //?-- Course Video -->
  static const String baseCourseVideo = '$baseCourse/videos/';

  //?-- Quiz -->
  static const String baseExam = 'exam/';
  static const String baseQuizLessonOf = '${baseExam}lessonsOf/';

  //?-- Quiz Lesson -->
  static const String baseExamLesson = 'exam_lessons/';
  static const String baseExamOfQuestion = '${baseExamLesson}questionsOf/';

  //?-- CATEGORY -->
  static const String baseCategory = 'categorys/';
  static const String baseFeedback = 'feedbacks/';
  static const String baseContact = 'contacts/';
  static const String baseOrder = 'order/';
}
