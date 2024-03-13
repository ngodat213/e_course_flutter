class Course {
  final String uid;
  final String teacherId;
  final String courseImage;
  final String title;
  final String description;
  final String time;
  final List<String> lessons;
  final String category;
  final double rating;
  final List<String> feedbacks;
  final int register;
  final String videos;

  const Course({
    required this.uid,
    required this.teacherId,
    required this.courseImage,
    required this.title,
    required this.description,
    required this.time,
    required this.lessons,
    required this.category,
    required this.rating,
    required this.feedbacks,
    required this.register,
    required this.videos,
  });

  factory Course.fromDoc(Map<String, dynamic> data) => Course(
        uid: data['course']['_id'],
        teacherId: data['course']['teacherId'],
        courseImage: data['course']['courseImage'],
        title: data['course']['title'],
        time: data['course']['time'],
        description: data['course']['description'],
        lessons: List.from(data['course']['lessons']),
        category: data['course']['category'],
        rating: data['course']['ratting'],
        feedbacks: List.from(data['course']['listFeedBack']),
        register: data['course']['register'],
        videos: data['course']['videos'],
      );
}
