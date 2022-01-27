class CategoryResponse {
  final List<Category>? categories;
  String? error;
  CategoryResponse({this.categories, this.error});

  factory CategoryResponse.fromMap(dynamic map) {
    List<Category> categories = [];
    if (map != null) {
      map.forEach((element) {
        categories.add(Category.fromMap(element));
      });
    }
    return CategoryResponse(categories: categories);
  }
}

class Category {
  final String? name;
  final String? description;
  final int? id;
  final String? uid;

  Category({
    this.name,
    this.description,
    this.id,
    this.uid,
  });

  factory Category.fromMap(dynamic map) {
    return Category(
      name: map['name'],
      description: map['description'],
      id: map['id'],
      uid: map['uid'],
    );
  }
}
