import 'package:e_course_flutter/enums/role_type.dart';

class User {
  final String? id;
  final String? email;
  final String? username;
  final String? photoUrl;
  final List<RoleType>? roles;
  final List<String>? courses;
  final List<String>? favouritesCourses;
  final List<String>? favouritesExams;
  final List<String>? finishedExams;
  final String? photoPublicId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const User({
    this.id,
    this.email,
    this.username,
    this.photoUrl,
    this.roles,
    this.courses,
    this.favouritesCourses,
    this.favouritesExams,
    this.finishedExams,
    this.createdAt,
    this.updatedAt,
    this.photoPublicId,
  });

  factory User.fromJson(Map<String, dynamic> data) => User(
        id: data['_id'] ?? "",
        email: data['email'] ?? "",
        username: data['username'] ?? "",
        photoUrl: data['photoUrl'] ?? "",
        roles: List<RoleType>.from(
            data['roles']?.map((e) => RoleType.values.byName(e)) ?? []),
        courses: List<String>.from(data['courses'] ?? []),
        favouritesCourses: List<String>.from(data['favouritesCourses'] ?? []),
        favouritesExams: List<String>.from(data['favouritesExams'] ?? []),
        finishedExams: List<String>.from(data['finishedExams'] ?? []),
        createdAt: DateTime.parse(data['createdAt']),
        updatedAt: DateTime.parse(data['updatedAt']),
        photoPublicId: data['photoPublicId'] ?? "",
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'email': email,
        'username': username,
        'photoUrl': photoUrl,
        'roles': roles?.map((e) => e.name).toList(),
        'courses': courses,
        'favouritesCourses': favouritesCourses,
        'favouritesExams': favouritesExams,
        'finishedExams': finishedExams,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'photoPublicId': photoPublicId,
      };
}
