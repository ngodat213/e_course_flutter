class Category {
  final String id;
  final String category;

  Category({required this.id, required this.category});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["_id"],
      category: json["category"],
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'category': category,
      };
}
