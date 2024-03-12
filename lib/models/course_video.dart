class CourseVideo {
  final String uid;
  final String title;
  final String part;
  final String video;
  final String description;
  final int hour;
  final int minute;
  final List<String> comment;

  const CourseVideo({
    required this.uid,
    required this.title,
    required this.part,
    required this.video,
    required this.description,
    required this.hour,
    required this.minute,
    required this.comment,
  });

  factory CourseVideo.fromDoc(Map<String, dynamic> data) => CourseVideo(
        uid: data['courseVideo']['_id'],
        title: data['courseVideo']['title'],
        part: data['courseVideo']['part'],
        video: data['courseVideo']['video'],
        description: data['courseVideo']['description'],
        hour: data['courseVideo']['hour'],
        minute: data['courseVideo']['minute'],
        comment: List.from(data['courseVideo']['comment']),
      );
}
