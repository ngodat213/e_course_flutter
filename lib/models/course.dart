class Course {
  final String? uid;
  final String? teacherId;
  final String? courseImage;
  final String? title;
  final String? description;
  final String? time;
  final String? category;
  final double? rating;
  final int? register;
  final List<String>? feedbacks;
  final List<String>? lessons;

  const Course({
    this.uid,
    this.teacherId,
    this.courseImage,
    this.title,
    this.description,
    this.time,
    this.lessons,
    this.category,
    this.rating,
    this.feedbacks,
    this.register,
  });

  factory Course.fromDoc(Map<String, dynamic> data) => Course(
        uid: data['_id'],
        teacherId: data['teacherId'],
        courseImage: data['courseImage'],
        title: data['title'],
        time: data['time'],
        description: data['description'],
        category: data['category'],
        rating: double.parse(data['rating'].toString()),
        register: data['register'],
        lessons: List<String>.from(data['lessons']),
        feedbacks: List<String>.from(data['feedbacks']),
      );
}
