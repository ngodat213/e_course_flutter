class Comment {
  final String uid;
  final int like;
  final String title;
  final String userId;
  final List<String> feedbacks;
  const Comment({
    required this.uid,
    required this.like,
    required this.title,
    required this.userId,
    required this.feedbacks,
  });

  factory Comment.fromDoc(Map<String, dynamic> data) => Comment(
        uid: data['comment']['_id'],
        like: data['comment']['like'],
        title: data['comment']['title'],
        userId: data['comment']['userId'],
        feedbacks: List.from(data['comment']['feedbacks']),
      );
}
