class CourseLesson {
  final String uid;
  final int selection;
  final String title;
  final List<String> videos;

  const CourseLesson({
    required this.uid,
    required this.selection,
    required this.title,
    required this.videos,
  });

  factory CourseLesson.fromDoc(Map<String, dynamic> data) => CourseLesson(
        uid: data['courseLesson']['_id'],
        title: data['courseLesson']['title'],
        selection: data['courseLesson']['selection'],
        videos: List.from(data['courseLesson']['videos']),
      );
}
