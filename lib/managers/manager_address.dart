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
  static const String baseAccount = '/user';
  static const String accountLogin = '$baseAccount/login';
  static const String accountSignup = '$baseAccount/signup';

  //?-- Course -->
  static const String baseCourse = '/course';
  static const String baseCourseLesson = '/courseLesson';
  static const String baseCourseVideo = '/courseVideo';

  //?-- Quiz -->
  static const String baseQuiz = '/quiz';
  static const String baseQuizLesson = '/quizLesson';
  static const String baseQuizQuestion = '/quizQuestion';

  //? -- CONVERSATION --
  static const String baseConversation = '/blog';

  //? -- CHANNEL MESSGAE --
  static const String baseChannelMessgae = '/channel-message';
  static const String getAllChannelMessage = '$baseChannelMessgae/get-all';

  //? -- SOCKET --
  static String sendMessageConversationSocket() => 'message:conversation:send';
  static String receiveMessageConversationSocket() =>
      'message:conversation:receive';
  static String sendMessageChannelSocket() => 'message:channel:send';
  static String receiveMessageChannelSocket() => 'message:channel:receive';
}
