import 'package:e_course_flutter/models/models.dart';
import 'package:e_course_flutter/models/teacher.dart';

class CourseFeedback {
  String? sId;
  Teacher? user;
  String? course;
  String? title;
  int? rating;
  DateTime? createdAt;
  DateTime? updatedAt;

  CourseFeedback(
      {this.sId,
      this.user,
      this.course,
      this.title,
      this.rating,
      this.createdAt,
      this.updatedAt});

  CourseFeedback.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? Teacher.fromJson(json['user']) : null;
    course = json['course'];
    title = json['title'];
    rating = json['rating'];
    createdAt = DateTime.parse(json['createdAt'].toString());
    updatedAt = DateTime.parse(json['updatedAt'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['course'] = course;
    data['title'] = title;
    data['rating'] = rating;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
