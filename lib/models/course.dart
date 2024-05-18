import 'package:e_course_flutter/models/models.dart';

class Course {
  String? id;
  String? title;
  int? price;
  String? description;
  int? rating;
  int? register;
  String? imageIntroduce;
  String? imagePublicId;
  String? videoIntroduce;
  String? videoPublicId;
  int? time;
  String? language;
  Teacher? teacher;
  Category? category;
  String? createdAt;
  String? updatedAt;

  Course(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.rating,
      this.register,
      this.imageIntroduce,
      this.imagePublicId,
      this.videoIntroduce,
      this.videoPublicId,
      this.time,
      this.language,
      this.teacher,
      this.category,
      this.createdAt,
      this.updatedAt});

  Course.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    rating = json['rating'];
    register = json['register'];
    imageIntroduce = json['imageIntroduce'];
    imagePublicId = json['imagePublicId'];
    videoIntroduce = json['videoIntroduce'];
    videoPublicId = json['videoPublicId'];
    time = json['time'];
    language = json['language'];
    teacher =
        json['teacher'] != null ? Teacher.fromJson(json['teacher']) : null;
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['rating'] = rating;
    data['register'] = register;
    data['imageIntroduce'] = imageIntroduce;
    data['imagePublicId'] = imagePublicId;
    data['videoIntroduce'] = videoIntroduce;
    data['videoPublicId'] = videoPublicId;
    data['time'] = time;
    data['language'] = language;
    if (teacher != null) {
      data['teacher'] = teacher!.toJson();
    }
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
