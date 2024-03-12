class User {
  final String uid;
  final String? email;
  final String? displayName;
  final String? photoUrl;
  final String? phoneNumber;
  final List<String>? favoritesCourse;
  final List<String>? favoritesTeacher;
  final List<String>? course;

  const User({
    required this.uid,
    this.email,
    this.displayName,
    this.photoUrl,
    this.phoneNumber,
    this.favoritesCourse,
    this.favoritesTeacher,
    this.course,
  });

  factory User.fromJson(Map<String, dynamic> data) => User(
        uid: data['user']['id'],
        email: data['user']['email'],
        displayName: data['user']['email'],
        photoUrl: data['user']['email'],
        phoneNumber: data['user']['email'],
        favoritesCourse: List.from(data['user']['favoriteCourse']),
        favoritesTeacher: List.from(data['user']['favoritesTeacher']),
        course: List.from(data['user']['course']),
      );
}
