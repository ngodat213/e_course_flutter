import 'package:e_course_flutter/models/exam_question.dart';

class ExamLesson {
  String? id;
  String? lesson;
  String? title;
  int? hour;
  int? minute;
  int? second;
  int? point;
  List<ExamQuestion>? questions;
  ExamLesson({
    this.id,
    this.lesson,
    this.title,
    this.hour,
    this.minute,
    this.second,
    this.point,
  });

  factory ExamLesson.fromDoc(Map<String, dynamic> data) => ExamLesson(
        id: data['_id'],
        lesson: data['lesson'],
        title: data['title'],
        hour: data['hour'],
        minute: data['minute'],
        second: data['second'],
        point: data['point'],
      );
}
