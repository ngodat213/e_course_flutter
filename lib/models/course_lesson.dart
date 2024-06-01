import 'package:e_course_flutter/models/models.dart';

class CourseLesson {
  String? id;
  String? title;
  int? selection;
  String? course;
  int? iV;
  String? deleteAt;
  List<CourseVideo>? videos;

  CourseLesson(
      {this.id,
      this.title,
      this.selection,
      this.course,
      this.iV,
      this.deleteAt,
      this.videos});

  CourseLesson.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    selection = json['selection'];
    course = json['course'];
    iV = json['__v'];
    deleteAt = json['deleteAt'];
    if (json['videos'] != null) {
      videos = <CourseVideo>[];
      json['videos'].forEach((v) {
        videos!.add(CourseVideo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['title'] = title;
    data['selection'] = selection;
    data['course'] = course;
    data['__v'] = iV;
    data['deleteAt'] = deleteAt;
    if (videos != null) {
      data['videos'] = videos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
