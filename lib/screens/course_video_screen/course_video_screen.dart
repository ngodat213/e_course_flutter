import 'package:e_course_flutter/screens/course_video_screen/widget/course_video_content.dart';
import 'package:flutter/material.dart';

class CourseVideoScreen extends StatefulWidget {
  const CourseVideoScreen({super.key});

  @override
  State<CourseVideoScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<CourseVideoScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: CourseVideoContent());
  }
}
