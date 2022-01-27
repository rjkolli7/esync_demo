class AddProductBody {
  String name;
  String description;
  String shortDescription;
  String categoryName;
  int categoryId;
  String price;

  AddProductBody({
    required this.name,
    required this.description,
    required this.shortDescription,
    required this.categoryName,
    required this.categoryId,
    required this.price,
  });
}
