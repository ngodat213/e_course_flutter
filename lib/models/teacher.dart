class Teacher {
  final String uid;
  final String userId;
  final String description;
  final List<String> courses;
  final List<String> blogs;
  final List<String> quizs;
  final List<String> qAs;

  const Teacher({
    required this.uid,
    required this.userId,
    required this.description,
    required this.courses,
    required this.blogs,
    required this.quizs,
    required this.qAs,
  });
  factory Teacher.fromDoc(Map<String, dynamic> data) => Teacher(
        uid: data['teacher']['_id'],
        userId: data['teacher']['userId'],
        description: data['teacher']['description'],
        courses: List.from(data['teacher']['courses']),
        blogs: List.from(data['teacher']['blogs']),
        quizs: List.from(data['lessons']['quizs']),
        qAs: List.from(data['lessons']['qAs']),
      );
}
