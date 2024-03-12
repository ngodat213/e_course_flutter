class QuizLesson {
  final String uid;
  final String lesson;
  final String title;
  final List<String> questions;
  final int hour;
  final int minute;
  final int second;
  final int point;
  const QuizLesson({
    required this.uid,
    required this.lesson,
    required this.title,
    required this.questions,
    required this.hour,
    required this.minute,
    required this.second,
    required this.point,
  });

  factory QuizLesson.fromDoc(Map<String, dynamic> data) => QuizLesson(
        uid: data['quizLesson']['_id'],
        lesson: data['quizLesson']['lesson'],
        title: data['quizLesson']['title'],
        questions: List.from(data['quizLesson']['questions']),
        hour: data['quizLesson']['hour'],
        minute: data['quizLesson']['minute'],
        point: data['quizLesson']['point'],
        second: data['quizLesson']['second'],
      );
}
