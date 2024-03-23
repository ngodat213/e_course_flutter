class CourseVideo {
  String? sId;
  String? title;
  int? part;
  String? videoUrl;
  String? description;
  int? hour;
  int? minute;
  List<Null>? comments;

  CourseVideo(
      {this.sId,
      this.title,
      this.part,
      this.videoUrl,
      this.description,
      this.hour,
      this.minute,
      this.comments});

  CourseVideo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    part = json['part'];
    videoUrl = json['videoUrl'];
    description = json['description'];
    hour = json['hour'];
    minute = json['minute'];
    comments = List.from(json['comments']);
  }
}
