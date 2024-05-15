class Exam {
  final String uid;
  final String title;
  final String imageUrl;
  final String description;
  final String category;
  final String imagePublicId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<String> lessons;

  const Exam({
    required this.uid,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.category,
    required this.imagePublicId,
    required this.createdAt,
    required this.updatedAt,
    required this.lessons,
  });

  factory Exam.fromJson(Map<String, dynamic> data) => Exam(
        uid: data['_id'],
        title: data['title'],
        imageUrl: data['imageUrl'],
        description: data['description'],
        category: data['category'],
        imagePublicId: data['imagePublicId'],
        createdAt: DateTime.parse(data['createdAt']),
        updatedAt: DateTime.parse(data['updatedAt']),
        lessons: List<String>.from(data['lessons'] ?? []),
      );

  Map<String, dynamic> toJson() => {
        '_id': uid,
        'title': title,
        'imageUrl': imageUrl,
        'description': description,
        'category': category,
        'imagePublicId': imagePublicId,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
        'lessons': lessons,
      };
}
