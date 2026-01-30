class ProductModel {
  final String id;
  final String name;
  final num price;
  final String image;
  final String description;
  final DateTime createdAt;
  final int quantity;
  final int review;
  final String size;
  final String category;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    required this.createdAt,
    required this.quantity,
    required this.review,
    required this.size,
    required this.category,
  });
  factory ProductModel.fromJson(Map<String, dynamic> data) {
    return ProductModel(
      id: data["id"],
      name: data["name"],
      price: (data["price"]).toDouble(),
      image: data["image"],
      description: data["description"] ?? "",
      createdAt: DateTime.parse(data["created_at"]),
      quantity: data["quantity"],
      review: data["review"] ?? 0,
      size: data["size"] ?? '',
      category: data["category"] ?? "",
    );
  }
}
