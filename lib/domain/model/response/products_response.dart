class ProductResponse {
  final List<Product>? products;
  String? error;
  ProductResponse({this.products, this.error});

  factory ProductResponse.fromMap(dynamic map) {
    List<Product> products = [];
    if (map != null) {
      map.forEach((element) {
        products.add(Product.fromMap(element));
      });
    }
    return ProductResponse(products: products);
  }
}

class Product {
  final String? name;
  final String? description;
  final String? shortDescription;
  final String? categoryName;
  final int? categoryId;
  final String? price;
  final String? uid;
  final int? id;

  Product({
    this.name,
    this.description,
    this.shortDescription,
    this.categoryName,
    this.categoryId,
    this.price,
    this.id,
    this.uid,
  });

  factory Product.fromMap(dynamic map) {
    return Product(
      name: map['name'],
      description: map['description'],
      shortDescription: map['shortDescription'],
      price: map['price'],
      categoryId: map['categoryId'],
      categoryName: map['categoryName'],
      uid: map['uid'],
      id: map['id'],
    );
  }
}
