class CourseVideo {
  String? id;
  int? part;
  String? title;
  int? hour;
  int? minute;
  String? videoUrl;
  String? videoPublicId;
  String? lesson;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? description;
  String? deleteAt;

  CourseVideo(
      {this.id,
      this.part,
      this.title,
      this.hour,
      this.minute,
      this.videoUrl,
      this.videoPublicId,
      this.lesson,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.description,
      this.deleteAt});

  CourseVideo.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    part = json['part'];
    title = json['title'];
    hour = json['hour'];
    minute = json['minute'];
    videoUrl = json['videoUrl'];
    videoPublicId = json['videoPublicId'];
    lesson = json['lesson'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    description = json['description'];
    deleteAt = json['deleteAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['part'] = part;
    data['title'] = title;
    data['hour'] = hour;
    data['minute'] = minute;
    data['videoUrl'] = videoUrl;
    data['videoPublicId'] = videoPublicId;
    data['lesson'] = lesson;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['description'] = description;
    data['deleteAt'] = deleteAt;
    return data;
  }
}
