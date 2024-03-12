class Course {
  final String uid;
  final String teacherId;
  final String courseImage;
  final String title;
  final String description;
  final String time;
  final List<String> lessons;
  final String category;
  final double ratting;
  final List<String> listFeedBack;
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
    required this.ratting,
    required this.listFeedBack,
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
        ratting: data['course']['ratting'],
        listFeedBack: List.from(data['course']['listFeedBack']),
        register: data['course']['register'],
        videos: data['course']['videos'],
      );
}
