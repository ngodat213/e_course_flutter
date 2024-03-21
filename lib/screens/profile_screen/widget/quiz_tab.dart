import 'package:e_course_flutter/screens/home_screen/widget/exam_done.dart';
import 'package:flutter/material.dart';

class QuizTab extends StatefulWidget {
  const QuizTab({super.key});

  @override
  State<QuizTab> createState() => _QuizTabState();
}

class _QuizTabState extends State<QuizTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
      child: const Column(
        children: [
          ExamDone(),
          ExamDone(),
          ExamDone(),
          ExamDone(),
          ExamDone(),
        ],
      ),
    );
  }
}
