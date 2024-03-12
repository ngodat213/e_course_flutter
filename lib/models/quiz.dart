// ignore_for_file: public_member_api_docs, sort_constructors_first

class Quiz {
  final String uid;
  final String title;
  final String image;
  final String description;
  final String type;
  final List<String> lessons;

  const Quiz({
    required this.uid,
    required this.title,
    required this.image,
    required this.description,
    required this.type,
    required this.lessons,
  });

  factory Quiz.fromDoc(Map<String, dynamic> data) => Quiz(
        uid: data['quiz']['_id'],
        title: data['quiz']['title'],
        image: data['quiz']['image'],
        description: data['quiz']['description'],
        type: data['quiz']['type'],
        lessons: List.from(data['lessons']),
      );
}
