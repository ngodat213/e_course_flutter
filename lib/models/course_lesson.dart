import 'package:e_course_flutter/models/models.dart';

class CourseLesson {
  String? id;
  String? title;
  int? selection;
  List<CourseVideo>? videos;

  CourseLesson({this.id, this.title, this.selection});

  CourseLesson.fromDoc(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    selection = json['selection'];
  }
}
