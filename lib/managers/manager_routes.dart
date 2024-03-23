part of 'manager_path_routes.dart';

class ManagerRoutes {
  ManagerRoutes._();

  static String splashScreen = '/';
  static String onboarding = '/onboarding';
  static String signInScreen = '/sign_in';
  static String signUpScreen = '/sign_up';
  static String forgotPwScreen = '/forgot_password';
  static String mainScreen = '/main_screen';
  static String homeScreen = '/home_screen';
  static String courseListScreen = '/course_list_screen';
  static String communityScreen = '/community_screen';
  static String courseVideoScreen = '/course_video_screen';
  static String courseDetailScreen = '/course_detail';
  static String quizScreen = '/detail_screen';
  static String quizPlayScreen = '/quiz_play_screen';
  static String favoriteScreen = '/favorite_screen';
  static String settingScreen = '/setting_screen';
  static String editProfileScreen = '/edit_profile_screen';
  static String commoInfoScreen = '/commo_info_screen';
  static String profileScreen = '/profile_screen';
  static String changeLanguage = '/change_language';

  static var manager = [
    GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: onboarding,
      page: () => const OnboardingScreen(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: signInScreen,
      page: () => const SignInScreen(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: signUpScreen,
      page: () => const SignUpScreen(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: forgotPwScreen,
      page: () => const ForgotPwScreen(),
      binding: ForgotPwBinding(),
    ),
    GetPage(
      name: mainScreen,
      page: () => const MainScreen(),
      binding: MainBinding(),
    ),
    GetPage(
      name: homeScreen,
      page: () => const HomeScreen(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: settingScreen,
      page: () => const SettingScreen(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: courseDetailScreen,
      page: () => const CourseDetailScreen(),
      binding: CourseDetailBinding(),
    ),
    GetPage(
      name: quizScreen,
      page: () => const QuizScreen(),
    ),
    GetPage(
      name: quizPlayScreen,
      page: () => const QuizPlayScreen(),
    ),
    GetPage(
      name: commoInfoScreen,
      page: () => const CommoInfoScreen(),
    ),
    GetPage(
      name: profileScreen,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: courseVideoScreen,
      page: () => const CourseVideoScreen(),
    ),
    GetPage(
      name: changeLanguage,
      page: () => const ChangeLanguageScreen(),
    ),
    GetPage(
      name: favoriteScreen,
      page: () => const FavoriteScreen(),
    ),
    GetPage(
      name: courseListScreen,
      page: () => const CourseListScreen(),
      binding: CourseListBinding(),
    ),
    GetPage(
      name: communityScreen,
      page: () => const CommunityScreen(),
      binding: CommunityBinding(),
    ),
  ];
}
