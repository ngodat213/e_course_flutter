import 'package:e_course_flutter/models/models.dart';

class Exam {
  final String? id;
  final String? title;
  final String? imageUrl;
  final String? imagePublicId;
  final String? description;
  final Category? category;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Exam({
    this.id,
    this.title,
    this.imageUrl,
    this.description,
    this.category,
    this.imagePublicId,
    this.createdAt,
    this.updatedAt,
  });

  factory Exam.fromJson(Map<String, dynamic> json) => Exam(
        id: json['_id'],
        title: json['title'],
        imageUrl: json['imageUrl'],
        description: json['description'],
        category: json['category'] != null
            ? Category.fromJson(json['category'])
            : null,
        imagePublicId: json['imagePublicId'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
      );

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
