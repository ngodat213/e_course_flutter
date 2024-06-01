class ExamQuestion {
  String? sId;
  String? question;
  List<String>? options;
  int? answer;
  String? imageUrl;
  String? imagePublicId;
  String? lesson;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? deleteAt;

  ExamQuestion(
      {this.sId,
      this.question,
      this.options,
      this.answer,
      this.imageUrl,
      this.imagePublicId,
      this.lesson,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.deleteAt});

  ExamQuestion.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    question = json['question'];
    options = json['options'].cast<String>();
    answer = json['answer'];
    imageUrl = json['imageUrl'];
    imagePublicId = json['imagePublicId'];
    lesson = json['lesson'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    deleteAt = json['deleteAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['question'] = question;
    data['options'] = options;
    data['answer'] = answer;
    data['imageUrl'] = imageUrl;
    data['imagePublicId'] = imagePublicId;
    data['lesson'] = lesson;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['deleteAt'] = deleteAt;
    return data;
  }
}
