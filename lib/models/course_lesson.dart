import 'package:e_course_flutter/models/models.dart';

class CourseLesson {
  String? sId;
  String? title;
  int? selection;
  List<CourseVideo>? videos;

  CourseLesson({this.sId, this.title, this.selection, this.videos});

  CourseLesson.fromDoc(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    selection = json['selection'];
    if (json['videos'] != null) {
      videos = <CourseVideo>[];
      json['videos'].forEach((v) {
        videos!.add(CourseVideo.fromJson(v));
      });
    }
  }
}
