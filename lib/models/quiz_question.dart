class QuizQuestion {
  final String uid;
  final String question;
  final List<String> options;
  final int answer;
  String? imagePath;

  QuizQuestion({
    required this.uid,
    required this.question,
    required this.options,
    required this.answer,
    this.imagePath,
  });

  factory QuizQuestion.fromDoc(Map<String, dynamic> data) => QuizQuestion(
        uid: data['question']['_id'],
        question: data['question']['question'],
        options: List.from(data['question']['options']),
        answer: data['question']['answer'],
        imagePath: data['question']['image'],
      );
}
