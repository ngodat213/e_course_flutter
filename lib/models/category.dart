class Category {
  String? id;
  String? category;
  String? deleteAt;

  Category({this.id, this.category, this.deleteAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    category = json['category'];
    deleteAt = json['deleteAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['category'] = category;
    data['deleteAt'] = deleteAt;
    return data;
  }
}
