class Teacher {
  String? sId;
  String? email;
  String? username;
  String? photoUrl;

  Teacher({this.sId, this.email, this.username, this.photoUrl});

  Teacher.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    username = json['username'];
    photoUrl = json['photoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['email'] = email;
    data['username'] = username;
    data['photoUrl'] = photoUrl;
    return data;
  }
}
