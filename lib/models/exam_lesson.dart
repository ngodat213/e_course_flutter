import 'package:e_course_flutter/models/exam_question.dart';

class ExamLesson {
  String? sId;
  String? title;
  int? hour;
  int? minute;
  int? second;
  int? selection;
  int? point;
  String? exam;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? deleteAt;
  List<ExamQuestion>? questions;

  ExamLesson(
      {this.sId,
      this.title,
      this.hour,
      this.minute,
      this.second,
      this.selection,
      this.point,
      this.exam,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.deleteAt,
      this.questions});

  ExamLesson.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    hour = json['hour'];
    minute = json['minute'];
    second = json['second'];
    selection = json['selection'];
    point = json['point'];
    exam = json['exam'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    deleteAt = json['deleteAt'];
    if (json['questions'] != null) {
      questions = <ExamQuestion>[];
      json['questions'].forEach((v) {
        questions!.add(ExamQuestion.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['hour'] = hour;
    data['minute'] = minute;
    data['second'] = second;
    data['selection'] = selection;
    data['point'] = point;
    data['exam'] = exam;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['deleteAt'] = deleteAt;
    if (questions != null) {
      data['questions'] = questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
