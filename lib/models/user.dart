class User {
  final String? token;
  final String? email;
  final String? username;
  final String? photoUrl;
  final List<String>? blogs;
  final List<String>? qAs;
  final List<String>? courses;
  final List<String>? favouritesCourses;
  final List<String>? favouritesQuizs;
  final List<String>? favouritesTeachers;
  final List<String>? finishedQuizs;
  final List<String>? favouritesBlogs;
  final List<String>? favouritesQAs;

  const User({
    this.token,
    this.email,
    this.username,
    this.photoUrl,
    this.blogs,
    this.qAs,
    this.courses,
    this.favouritesCourses,
    this.favouritesQuizs,
    this.favouritesTeachers,
    this.finishedQuizs,
    this.favouritesBlogs,
    this.favouritesQAs,
  });

  factory User.fromJson(Map<String, dynamic> data) => User(
        token: data['token'],
        email: data['email'],
        username: data['username'],
        photoUrl: data['photoUrl'],
        blogs: List<String>.from(data['blogs'] ?? []),
        qAs: List<String>.from(data['qAs'] ?? []),
        courses: List<String>.from(data['courses'] ?? []),
        favouritesCourses: List<String>.from(data['favouritesCourses'] ?? []),
        favouritesQuizs: List<String>.from(data['favouritesQuizs'] ?? []),
        favouritesTeachers: List<String>.from(data['favouritesTeachers'] ?? []),
        finishedQuizs: List<String>.from(data['finishedQuizs'] ?? []),
        favouritesBlogs: List<String>.from(data['favouritesBlogs'] ?? []),
        favouritesQAs: List<String>.from(data['favouritesQAs'] ?? []),
      );

  Map<String, dynamic> toJson() => {
        'token': token,
        'email': email,
        'username': username,
        'photoUrl': photoUrl,
        'blogs': blogs,
        'qAs': qAs,
        'courses': courses,
        'favouritesCourses': favouritesCourses,
        'favouritesQuizs': favouritesQuizs,
        'favouritesTeachers': favouritesTeachers,
        'finishedQuizs': finishedQuizs,
        'favouritesBlogs': favouritesBlogs,
        'favouritesQAs': favouritesQAs,
      };
}
