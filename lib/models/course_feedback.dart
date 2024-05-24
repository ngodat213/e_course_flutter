import 'package:e_course_flutter/models/models.dart';

class CourseFeedback {
  String? uid;
  Teacher? userId;
  String? courseId;
  String? time;
  double? rating;
  CourseFeedback({
    this.uid,
    this.userId,
    this.courseId,
    this.time,
    this.rating,
  });

  CourseFeedback.fromJson(Map<String, dynamic> json) {
    uid = json['_id'];
    userId = json['userId'] != null ? Teacher.fromJson(json['userId']) : null;
    courseId = json['courseId'];
    time = json['title'];
    rating = json['rating'];
  }
}
