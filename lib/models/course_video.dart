class CourseVideo {
  final String? id;
  final String? title;
  final int? part;
  final String? videoUrl;
  final String? videoPublicId;
  final String? description;
  final int? hour;
  final int? minute;
  final String? lesson;

  const CourseVideo({
    this.id,
    this.title,
    this.part,
    this.videoUrl,
    this.videoPublicId,
    this.description,
    this.hour,
    this.minute,
    this.lesson,
  });

  factory CourseVideo.fromDoc(Map<String, dynamic> json) => CourseVideo(
        id: json['_id'],
        title: json['title'],
        part: json['part'],
        videoUrl: json['videoUrl'],
        videoPublicId: json['videoPublicId'],
        description: json['description'],
        hour: json['hour'],
        lesson: json['lesson'],
        minute: json['minute'],
      );
}
