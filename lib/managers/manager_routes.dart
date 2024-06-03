part of 'manager_path_routes.dart';

class ManagerRoutes {
  ManagerRoutes._();

  static String splashScreen = '/';
  static String onboarding = '/onboarding';
  static String signInScreen = '/sign_in';
  static String signUpScreen = '/sign_up';
  static String forgotPwScreen = '/forgot_password';
  static String otpScreen = '/otp_screen';
  static String resetPasswordScreen = '/reset_password_screen';
  static String mainScreen = '/main_screen';
  static String homeScreen = '/home_screen';
  static String courseListScreen = '/course_list_screen';
  static String myCourseScreen = '/my_course_screen';
  static String examListScreen = '/exam_list_screen';
  static String communityScreen = '/community_screen';
  static String courseVideoScreen = '/course_video_screen';
  static String courseDetailScreen = '/course_detail';
  static String examDetailScreen = '/exam_detail_screen';
  static String examPlayScreen = '/quiz_play_screen';
  static String favoriteCourseScreen = '/favorite_course_screen';
  static String favoriteExamScreen = '/favorite_exam_screen';
  static String settingScreen = '/setting_screen';
  static String editProfileScreen = '/edit_profile_screen';
  static String aboutUsScreen = '/about_us_screen';
  static String contactScreen = '/contact_creen';
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
      name: examDetailScreen,
      page: () => const ExamDetailScreen(),
      binding: ExamDetailBinding(),
    ),
    GetPage(
      name: examPlayScreen,
      page: () => const ExamPlayScreen(),
      binding: ExamPlayBinding(),
    ),
    GetPage(
      name: contactScreen,
      page: () => const ContactScreen(),
      binding: ContactBinding(),
    ),
    GetPage(
      name: aboutUsScreen,
      page: () => const AboutUsScreen(),
    ),
    GetPage(
      name: profileScreen,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: courseVideoScreen,
      page: () => const CourseVideoScreen(),
      binding: CourseVideoBinding(),
    ),
    GetPage(
      name: courseListScreen,
      page: () => const CourseListScreen(),
      binding: CourseListBinding(),
    ),
    GetPage(
      name: changeLanguage,
      page: () => const ChangeLanguageScreen(),
      binding: ChangeLanguageBinding(),
    ),
    GetPage(
      name: myCourseScreen,
      page: () => const MyCourseScreen(),
      binding: MyCourseBinding(),
    ),
    GetPage(
      name: favoriteCourseScreen,
      page: () => const FavoriteCourseScreen(),
      binding: FavoriteCourseBinding(),
    ),
    GetPage(
      name: favoriteExamScreen,
      page: () => const FavoriteExamScreen(),
      binding: FavoriteExamBinding(),
    ),
    GetPage(
      name: otpScreen,
      page: () => const OTPScreen(),
    ),
    GetPage(
      name: resetPasswordScreen,
      page: () => const ResetPasswordScreen(),
    ),
    GetPage(
      name: examListScreen,
      page: () => const ExamListScreen(),
    )
  ];
}
