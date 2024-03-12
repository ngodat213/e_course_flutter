class CourseFeedback {
  final String uid;
  final String userId;
  final String time;
  final double ratting;
  final String feedback;
  const CourseFeedback({
    required this.uid,
    required this.userId,
    required this.time,
    required this.ratting,
    required this.feedback,
  });

  CourseFeedback copyWith({
    String? uid,
    String? userId,
    String? time,
    double? ratting,
    String? feedback,
  }) {
    return CourseFeedback(
      uid: uid ?? this.uid,
      userId: userId ?? this.userId,
      time: time ?? this.time,
      ratting: ratting ?? this.ratting,
      feedback: feedback ?? this.feedback,
    );
  }

  factory CourseFeedback.fromDoc(Map<String, dynamic> data) => CourseFeedback(
        uid: data['courseFeedback']['_id'],
        userId: data['courseFeedback']['teacher_id'],
        time: data['courseFeedback']['time'],
        ratting: data['courseFeedback']['ratting'],
        feedback: data['courseFeedback']['feedback'],
      );
}
