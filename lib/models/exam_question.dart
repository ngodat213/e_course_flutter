class ExamQuestion {
  final String id;
  final String question;
  final List<String> options;
  final int answer;
  String? imagePath;

  ExamQuestion({
    required this.id,
    required this.question,
    required this.options,
    required this.answer,
    this.imagePath,
  });

  factory ExamQuestion.fromDoc(Map<String, dynamic> data) => ExamQuestion(
        id: data['_id'],
        question: data['question'],
        options: List.from(data['options']),
        answer: data['answer'],
        imagePath: data['image'],
      );
}
