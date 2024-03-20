class CourseFeedback {
  final String uid;
  final String userId;
  final String time;
  final double rating;
  final String feedback;
  const CourseFeedback({
    required this.uid,
    required this.userId,
    required this.time,
    required this.rating,
    required this.feedback,
  });

  CourseFeedback copyWith({
    String? uid,
    String? userId,
    String? time,
    double? rating,
    String? feedback,
  }) {
    return CourseFeedback(
      uid: uid ?? this.uid,
      userId: userId ?? this.userId,
      time: time ?? this.time,
      rating: rating ?? this.rating,
      feedback: feedback ?? this.feedback,
    );
  }

  factory CourseFeedback.fromDoc(Map<String, dynamic> data) => CourseFeedback(
        uid: data['courseFeedback']['_id'],
        userId: data['courseFeedback']['teacher_id'],
        time: data['courseFeedback']['time'],
        rating: data['courseFeedback']['rating'],
        feedback: data['courseFeedback']['feedback'],
      );
}
