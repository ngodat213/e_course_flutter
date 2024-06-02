import 'package:e_course_flutter/models/models.dart';

class Exam {
  String? id;
  String? title;
  String? imageUrl;
  String? imagePublicId;
  String? description;
  Category? category;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? deleteAt;

  Exam({
    this.id,
    this.title,
    this.imageUrl,
    this.description,
    this.category,
    this.imagePublicId,
    this.createdAt,
    this.updatedAt,
    this.deleteAt,
  });

  Exam.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    imageUrl = json['imageUrl'];
    description = json['description'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    imagePublicId = json['imagePublicId'];
    createdAt = DateTime.parse(json['createdAt']);
    updatedAt = DateTime.parse(json['updatedAt']);
    deleteAt = json['deleteAt'];
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'title': title,
        'imageUrl': imageUrl,
        'description': description,
        'category': category,
        'imagePublicId': imagePublicId,
        'createdAt': createdAt!.toIso8601String(),
        'updatedAt': updatedAt!.toIso8601String(),
      };
}
